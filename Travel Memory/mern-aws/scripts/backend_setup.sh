#!/bin/bash

# Step 1: Update the system
sudo apt update -y
sudo apt upgrade -y

# Step 2: Install Node.js and npm
sudo apt install -y nodejs npm

# Step 3: Install Git
sudo apt install -y git

# Step 4: Clone the backend repository
git clone https://github.com/UnpredictablePrashant/learnerReportCS_backend.git /home/backend

# Step 5: Navigate to backend directory
cd /home/backend


# Step 6: Install dependencies
npm install

# Step 7: Configure environment variables
echo "MONGO_URI=mongodb+srv://ShivBatch8:Mongopass1@shiv.bh0ao.mongodb.net/?retryWrites=true&w=majority&appName=shiv" > .env
echo "PORT=5000" >> .env

# Step 8: Start the backend server
nohup node server.js > backend.log 2>&1 &
