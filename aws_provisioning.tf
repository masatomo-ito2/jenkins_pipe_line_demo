variable "node_count" {
	default = "1"
}
variable "env_name" {
	default = "QA"
}

provider "aws" {
  region     = "ap-northeast-1"
}

resource "aws_instance" "masa_tfe" {
  ami           = "ami-08847abae18baa040"
  instance_type = "t2.micro"
  count			= "${var.node_count}"

  # My security setting
  security_groups = ["${aws_security_group.jenkins_security_group.name}"]
  tags {
  	Name = "${var.env_name}"
  }
}

resource "aws_security_group" "jenkins_security_group" {
  name        = "security group for ${var.env_name}"
  description = "Allow access to SSH port"
}

