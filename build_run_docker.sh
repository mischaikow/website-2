cd /home/ec2-user/website

echo 'Running git pull'
git pull
dt=$(date '+%d/%m/%Y %H:%M:%S')
echo 'git pull at' $dt 

dcoker network create mischaikow-home

echo 'Building and deploying backend'
cd /home/ec2-user/website/backend
docker buildx build --no-cache -t site/backend -f Dockerfile .
docker stop mischaikow-backend
docker run --rm -d -p 5000:5000 --network=mischaikow-home --name mischaikow-backend --init site/backend

sleep 5s
backend=curl http://127.0.0.1:5000
dt=$(date '+%d/%m/%Y %H:%M:%S')
if [ $backend == 'Backend is up']
then
    echo 'Backend up and running' $dt
else
    echo 'Backend is NOT up and running -- check backend' $dt
fi

echo 'Building and deploying frontend'
cd /home/ec2-user/website/frontend
docker buildx build --no-cache -t site/frontend -f Dockerfile .
docker stop mischaikow-frontend
docker run --rm -d -p 4173:4173 --network=mischaikow-home --name mischaikow-frontend --init site/frontend

sleep 5s
frontend=$(curl -o /dev/null -s -w "%{http_code}\n" -I http://127.0.0.1:4173)
dt=$(date '+%d/%m/%Y %H:%M:%S')
if [ "$frontend" -eq 200 ]
then
    echo 'Frontend up and running' $dt
else
    echo 'Frontend is NOT up and running -- check frontend' $dt
fi

echo 'Building and deploying reverse proxy'
cd /home/ec2-user/website/nginx
docker buildx build --no-cache -t site/nginx -f Dockerfile .
docker stop mischaikow-nginx
docker run --rm -d -p 80:80 -p 443:443 --network=mischaikow-home --name mischaikow-nginx --init site/nginx

sleep 5s
dt=$(date '+%d/%m/%Y %H:%M:%S')
if [ "$( docker container inspect -f '{{.State.Status}}' mischaikow-nginx)" = "running" ];
then
    echo 'Nginx up and running' $dt
else
    echo 'Nginx is NOT up and running -- check reverse proxy' $dt
fi

dt=$(date '+%d/%m/%Y %H:%M:%S')
echo 'Script Complete at' $dt 
unset dt
