terraform {
	backend "remote" {
		organization = "masa_org"

		workspaces {
			prefix = "jenkins_pipeline_"
		}
	}
}

variable "node_count" {
	default = "1"
}

variable "env_name" {
	default = "QA"
}

provider "aws" {
	region     = "ap-northeast-1"
}

resource "aws_instance" "itmstm" {
	ami				= "ami-08847abae18baa040"
	instance_type	= "t2.micro"
	count			= "${var.node_count}"

	# My security setting
	security_groups = ["${aws_security_group.default.name}"]
	tags {
		Name = "${var.env_name}_${count.index}"
	}
}

resource "aws_security_group" "default" {
	name		= "Jenkins_security_group for ${var.env_name}"
	description = "Allow access to SSH port"
}
