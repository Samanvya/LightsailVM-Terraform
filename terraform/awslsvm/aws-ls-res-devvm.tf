resource "aws_lightsail_instance" "devops" {
  name              = "${var.vmname}"
  availability_zone = "${lookup(var.az, var.region)}"
  blueprint_id      = "ubuntu_18_04"
  bundle_id         = "${lookup(var.bundle_id, var.region)}"
  key_pair_name     = "${var.keypairname}"
}