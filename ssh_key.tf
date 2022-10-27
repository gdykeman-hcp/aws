# #Generate private key
# resource "tls_private_key" "gdykeman_key" {
#   algorithm = "RSA"
#   rsa_bits = 4096
# }

# #Create key pair in AWS
# resource "aws_key_pair" "gdykeman_key" {
#   key_name = "gdykeman_key"
#   public_key = tls_private_key.gdykeman_key.public_key_openssh
# }

# #Store key file
# resource "local_file" "ssh_key" {
#   filename = "${aws_key_pair.gdykeman_key.key_name}.pem"
#   content = tls_private_key.gdykeman_key.private_key_pem
# }