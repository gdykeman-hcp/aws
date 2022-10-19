terraform {
  cloud {
    organization = "gdykeman-hashicorp"
    workspaces {
      name = "aws"
    }
  }
}
# terraform {
#   backend "s3" {
#     bucket = "gdykeman.tfstate"
#     key = "terraform/tfstate"
#     region = "us-east-1"
#   }
# }