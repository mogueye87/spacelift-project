
data "aws_ami" "my_ubuntu_ami" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["my_ubuntu_ami"]
  }

}

# create ec2 instance from image build with packer
resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.my_ubuntu_ami.id
  instance_type = "t2.large"
  tags = {
    "Name" = "my_ubuntu_ami"
  }
}