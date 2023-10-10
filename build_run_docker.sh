cd /home/ec2-user/website

echo 'Running git pull'
git pull
dt=$(date '+%d/%m/%Y %H:%M:%S')
echo 'git pull at' $dt 

echo 'Building and deploying backend'
cd backend
docker buildx build --no-cache -t site/backend -f Dockerfile .
docker stop mischaikow-backend
docker run --rm -d -p 5000:5000 --name mischaikow-backend --init site/backend

sleep 5s
backend=curl http://127.0.0.1:5000
dt=$(date '+%d/%m/%Y %H:%M:%S')
if [ $backend == 'Backend is up']
then
    echo 'Backend up and running' $dt
else
    echo 'Backend is NOT up and running -- check backend' $dt
fi

dt=$(date '+%d/%m/%Y %H:%M:%S')
echo 'Script Complete at' $dt 
unset dt
