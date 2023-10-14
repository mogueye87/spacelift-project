
data "aws_ami" "my_ubuntu_ami" {
    most_recent = true
    owners = [ self ]
    filter {
      name = "name"
      values = [ "my_ubuntu_ami" ]
    }
  
}

resource "aws_instance" "ubuntu" {
  ami = data.aws_ami.my_ubuntu_ami.id
  instance_type = "t2.micro"
  tags = {
    "Name" = "my_ubuntu_ami"
  }
}