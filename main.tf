variable "my_vpc" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}
variable "env_prefix2" {}
variable "instance_type" {}
variable "instance_name" {}
variable "ami-image" {}
variable "ec2-instances" {}
variable "sgs" {}

resource "aws_security_group" "sonatype-nexus-sg" {
  name = "nexus-sg"
  description = "opening port 8081 for sonatype nexus"
  vpc_id = var.my_vpc
  

  ingress {
    from_port = 8081
    to_port = 8081
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name: "${var.env_prefix2}-sg"
  }
}



data "local_file" "user_data" {
  for_each = { for ec2 in var.ec2-instances : ec2.name => ec2 }
  filename = "${path.module}/${each.value.user_data}"
}

resource "aws_instance" "nexus-server" {
  #ami = "ami-0440d3b780d96b29d"
  for_each = { for instance in var.ec2-instances : instance.name => instance }
  ami = var.ami-image.ubuntu
  instance_type = var.instance_type
  subnet_id = var.subnet_cidr_block
  vpc_security_group_ids = [ aws_security_group.sonatype-nexus-sg.id, var.sgs ]
  availability_zone = var.avail_zone[0]
  associate_public_ip_address = true
  key_name = "practice"
  user_data  = "${data.local_file.user_data[each.value.name].content}"
  #for_each = toset([ var.instance_name[0], var.instance_name[1], var.instance_name[2] ])
  
  tags = {
    Name: var.ec2-instances[0].name
  }
}