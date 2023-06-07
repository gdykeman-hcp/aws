instances = {
  dev_server = {
    instance_type = "t2.small"
    ami           = "ami-06640050dc3f556bb"
    key_name      = "gdykeman"
    env           = "development"
  }
  test_server = {
    instance_type = "t2.micro"
    ami           = "ami-08c40ec9ead489470"
    key_name      = "gdykeman"
    env           = "development"
  }
  prod_server = {
    instance_type = "t2.small"
    ami           = "ami-09d3b3274b6c5d4aa"
    key_name      = "gdykeman"
    env           = "qa"
  }
  config_server = {
    instance_type = "t2.small"
    ami           = "ami-06640050dc3f556bb"
    key_name      = "gdykeman"
    env           = "qa"
  }
}