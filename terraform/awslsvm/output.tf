 output "ip" {
        value = "${aws_lightsail_static_ip.devops.ip_address}"
 }