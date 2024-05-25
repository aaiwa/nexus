my_vpc = "vpc-05b50bad61ffecce3"
subnet_cidr_block = "subnet-0681f746d38efe0f1"
avail_zone = ["us-east-1a", "us-east-1b"]
env_prefix = "dev"
env_prefix2 ="nexus"
instance_type = "t2.medium"
instance_name = ["nexus-repository"]
sgs = "sg-024866419d83d9fff"
ami-image = {
    amazon_linux_2023 ="ami-0440d3b780d96b29d"
    ubuntu ="ami-0e001c9271cf7f3b9"
}

ec2-instances= [
  {
    name = "nexus-node"
    user_data = "si.sh"
  }
  
]

