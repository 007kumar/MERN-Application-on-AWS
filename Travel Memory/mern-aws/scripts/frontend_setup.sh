#!/bin/bash
sudo apt update -y
sudo apt install -y nginx git
git clone https://github.com/your-frontend-repo.git
cd your-frontend-repo
echo "const backendURL = 'http://<backend-ip>:5000';" > src/url.js
npm install
npm run build
cp -r build/* /var/www/html/

