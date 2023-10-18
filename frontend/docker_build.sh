docker buildx build -t site/frontend_dev -f ./Dockerfile.dev .
docker stop mischaikow-frontend
docker run --rm -d -p 80:80 -p 443:443 --name mischaikow-backend --init site/backend_dev
