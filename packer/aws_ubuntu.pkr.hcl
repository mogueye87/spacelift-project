packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "my_ubuntu_ami"
  instance_type = "t2.micro"
  region        = "us-east-1"
  ssh_username  = "ubuntu"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }

    most_recent = true
    owners      = ["099720109477"]
  }
}

build {
  name = "my_ubuntu_ami"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}
