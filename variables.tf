
variable "aws_region" {
    description       = "AWS region"
    type              = string
    default           = "eu-central-1"
}

variable "instance_type" {
    description       = "Instance type"
    type              = string
    default           = "t2.micro"
}

variable "ami" {
    description       = "AMI"
    default           = "ami-0d527b8c289b4af7f" 
      
}
