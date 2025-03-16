# Define security group for frontend & backend
data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = ["ShivBatch8"]
  }
}

# Define VPC
data "aws_vpc" "mern_vpc" {
  filter {
    name   = "tag:Name"
    values = ["Default"]
  }
   # id =  vpc-03c56cda94b8d7229
}

resource "aws_instance" "frontend" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = var.instance_type
  key_name      = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-093d53da901ae4dcf"]
  user_data     = file("scripts/frontend_setup.sh")

  tags = {
    Name = "Frontend-skumar"
  }
}

resource "aws_instance" "backend" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = var.instance_type
  key_name      = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-093d53da901ae4dcf"]
  user_data     = file("scripts/backend_setup.sh")

  tags = {
    Name = "Backend-skumar"
  }
}

data "aws_internet_gateway" "existing_igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.mern_vpc.id]
  }
}
#----------
resource "aws_route_table" "public_rt" {
  vpc_id = data.aws_vpc.mern_vpc.id  # Use existing VPC

  tags = {
    Name = "Skumar-public-route-table"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = data.aws_internet_gateway.existing_igw.id  # Use existing IGW
}


#-------------------------------------------

#----------------------------------------------
data "aws_subnet" "existing_subnet" {
  id = "subnet-01f49577105f3014b"  # Replace with your subnet ID
}

resource "aws_instance" "mern_app" {
  ami           = "ami-04b4f1a9cf54c11d0"  
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.existing_subnet.id  # Dynamically fetch subnet

  tags = {
    Name = "skumar-MERN-Instance"
  }
}
