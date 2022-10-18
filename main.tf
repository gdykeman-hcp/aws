terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = "${var.region["primary"]}"
  # access_key = "${var.aws_access_key}"
  # secret_key = "${var.aws_secret_key}"
}
resource "aws_instance" "rhel" {
  ami           = "${lookup(var.amis, var.region["primary"])}"
  instance_type = "${lookup(var.instance_type, var.region["primary"])}"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.rhel.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}