provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "dpp"
    security_groups = [ "sg-0a288e71ff0fdd0f3" ]
    //vpc_security_group_ids = [aws_security_group.demo-sg.id]
    subnet_id = "subnet-08121849bf257d0b1"
    for_each = toset(["demo124"])
    tags = {
      Name = "${each.key}"
   }
}