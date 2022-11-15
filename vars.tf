variable "vpc_vars" {
    default = {
        region = "us-east-1"
        az = "us-east-1a"
        cidr = "10.1.0.0/16"
        subnet = "10.1.1.0/24"
        rt_cidr = "0.0.0.0/0"
    }
}
variable "instances" {
    default = {
        dev_server = {
            instance_type = "t2.small"
            ami = "ami-06640050dc3f556bb"
            key_name = "gdykeman"
        }
        test_server = {
            instance_type = "t2.micro"
            ami = "ami-08c40ec9ead489470"
            key_name = "gdykeman"
        }
        prod_server = {
            instance_type = "t2.small"
            ami = "ami-09d3b3274b6c5d4aa"
            key_name = "gdykeman"
        }
        config_server = {
            instance_type = "t2.medium"
            ami = "ami-06640050dc3f556bb"
            key_name = "gdykeman"
        }
    }
}

variable "amis" {
    type = map(string)
    default = {
        rhel = "ami-06640050dc3f556bb"
        ubuntu = "ami-06640050dc3f556bb"
        amazon = "ami-09d3b3274b6c5d4aa"
    }

}

variable "rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    proto       = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 80
      to_port     = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = -1
      to_port     = -1
      proto       = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 443
      to_port     = 443
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 5432
      to_port     = 5432
      proto       = "tcp"
      cidr_blocks = ["10.10.10.10/32"]
    }
  ]
}