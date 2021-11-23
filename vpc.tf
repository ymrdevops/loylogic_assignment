resource "aws_vpc" "dev-vpc" {
    cidr_block = "172.20.0.0/16"
    enable_dns_support = "true" 
    enable_dns_hostnames = "true" 
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags {
        Name = "dev-vpc"
    }
}


resource "aws_subnet" "dev-subnet-public-1" {
    vpc_id = "${aws_vpc.dev-vpc.id}"
    cidr_block = "172.20.10.0/24"
    map_public_ip_on_launch = "true" 
    availability_zone = "us-east-1a"
    tags {
        Name = "dev-subnet-public-1"
    }
}



