Deploying MERN Stack Application on AWS using Terraform & Ansible

Part 1: Infrastructure Setup with Terraform

1. AWS Setup and Terraform Initialization

Install and configure the AWS CLI.

Authenticate with AWS using access keys.

Initialize a Terraform project with AWS as the provider.

2. VPC and Network Configuration

Create a VPC with two subnets:

Public Subnet (for the web server)

Private Subnet (for the database server)

Set up an Internet Gateway for public access.

Configure a NAT Gateway for internet access from the private subnet.

Define appropriate route tables for subnets.

3. EC2 Instance Provisioning

Launch two EC2 instances:

Web Server (Public subnet)

Database Server (Private subnet)

Ensure SSH access is only allowed for the web server from your IP.

4. Security Groups and IAM Roles

Create security groups to allow:

HTTP/HTTPS traffic to the web server

MongoDB access only within the private subnet

SSH access from a specific IP

Assign IAM roles with necessary permissions for EC2 instances.

5. Resource Outputs

Output key details such as:

Public IP of the web server

Private IP of the database server

Part 2: Configuration and Deployment with Ansible

1. Ansible Configuration

Set up an Ansible inventory to define AWS EC2 instances.

Configure Ansible to communicate with EC2 instances using SSH.

2. Web Server Setup

Install Node.js and NPM.

Clone the TravelMemory repository.

Install required application dependencies.

3. Database Server Setup

Install and configure MongoDB on the private EC2 instance.

Secure MongoDB by creating a user and restricting access.

4. Application Deployment

Set environment variables required for the MERN application.

Start the Node.js backend and ensure it connects with MongoDB.

Deploy the React frontend and verify connectivity with the backend.

5. Security Hardening

Configure firewalls and security groups to restrict unnecessary access.

Enforce SSH key authentication and disable root login.

Apply other security best practices as needed.




Prerequisites

AWS account with permissions for EC2, VPC, and IAM.

Terraform and Ansible installed on your local system.

SSH access to EC2 instances.
