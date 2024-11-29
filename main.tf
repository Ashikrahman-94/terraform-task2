# Provider for us-east-2 region
provider "aws" {
  region = "us-east-2"
  alias  = "us_east_2"
}

# Provider for us-west-1 region
provider "aws" {
  region = "us-west-1"
  alias  = "us_west_1"
}

# EC2 instance in us-east-2 region
resource "aws_instance" "instance_us_east_2" {
  provider      = aws.us_east_2
  ami           = "ami-0c80e2b6ccb9ad6d1"  
  instance_type = "t2.micro"
  key_name      = "Aws"                    
  tags = {
    Name = "Nginx-Instance-East-2"
  }

  # User data to install Nginx
  user_data = <<-EOT
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras enable nginx1
    sudo yum install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOT
}

# EC2 instance in us-west-1 region
resource "aws_instance" "instance_us_west" {
  provider      = aws.us_west_1
  ami           = "ami-038bba9a164eb3dc1"  
  instance_type = "t2.micro"
  key_name      = "Aws"                    
  tags = {
    Name = "Nginx-Instance-West"
  }

  # User data to install Nginx
  user_data = <<-EOT
    #!/bin/bash
    sudo yum update -y
    sudo amazon-linux-extras enable nginx1
    sudo yum install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
  EOT
}
