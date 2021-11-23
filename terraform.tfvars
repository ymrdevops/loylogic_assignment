variable "AWS_REGION" {    
    default = "us-east-1"
}

variable "AMI" {
    type = "map"
    
    default {
        eu-west-2 = "ami-xxxxxxx"
        us-east-1 = "ami-xxxxxxx"
    }
}