terraform {
    required_providers {
        aws = {
            source              = "hashicorp/aws"
            version             = "~> 3.27"
        }
    }

    required_version = ">= 0.14.9"
}

provider "aws" {
    profile                     = "default"
    region                      = var.aws_region
}

resource "aws_instance" "tomcat" {
    ami                         = var.ami
    instance_type               = var.instance_type
    vpc_security_group_ids      = [aws_security_group.tomcat.id]
    key_name                    = "aws_key"
    user_data                  = file("setup_tomcat.sh")

    tags = {
        Name                    = "Tomcat_webserver"
    }
}

resource "aws_key_pair" "tomcat" {
  key_name                      = "aws_key"
  public_key                    =  file("F:/Users/HookahEl/.ssh/aws_key.pub")
}

resource "aws_security_group" "tomcat" {
    name                        = "Security_228"
    description                 = "Security group done by Terraform"

    dynamic "ingress" {
        for_each = ["80", "22", "443", "8080"]
        content {
            from_port           = ingress.value
            to_port             = ingress.value
            protocol            = "TCP"
            cidr_blocks         = ["0.0.0.0/0"]
        }
       
    }
    
    egress {
        from_port               = 0
        to_port                 = 0
        protocol                = "-1"
        cidr_blocks             = ["0.0.0.0/0"]
    }
}
  

