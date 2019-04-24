variable "region" {}
variable "vmname" {}
variable "staticip" {}
variable "keypairname" {}
variable "bundle_id" {
    type = "map"
    default = {
        "ap-southeast-1" = "micro_2_0"
        "ap-south-1" = "micro_2_1"
        }
        }
variable "az" {
    type = "map"
    default = {
        "ap-southeast-1" = "ap-southeast-1a"
        "ap-south-1" = "ap-south-1a"
        }
}