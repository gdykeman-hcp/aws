variable "region" {
    type = map(string)
    default = {
        primary = "us-east-1"
        secondary = "us-east-2"
    }
}

variable "amis" {
    type = map(string)
    default = {
        "us-east-1" = "ami-06640050dc3f556bb"
        "us-west-2" = "ami-0186e3fec9b0283ee"
    }
}

variable "instance_type" {
    type = map(string)
    default = {
        "us-east-1" = "t2.micro"
        "us-west-2" = "t2.micro"
    }
}
