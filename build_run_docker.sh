cd /home/ec2-user/website

git pull
dt=$(date '+%d/%m/%Y %H:%M:%S')
echo 'git pulled' $dt 

cd backend
docker buildx build --no-cache -t site/backend -f Dockerfile .
docker stop mischaikow-backend
docker run --rm -d -p 5000:5000 --name mischaikow-backend --init site/backend
dt=$(date '+%d/%m/%Y %H:%M:%S')
echo 'Script Completed' $dt 

unset dt
sleep 5s
curl http://127.0.0.1:5000
