cd /home/ec2-user/website
git pull
npm install
cd backend
docker buildx build --no-cache -t site/backend -f Dockerfile .
docker stop mischaikow-backend
docker run --rm -d -p 5000:5000 --name mischaikow-backend --init site/backend
