module "awslsvm" {
  source  = "../awslsvm/"
  region = "ap-south-1"
  vmname = "devopsvm"
  staticip = "lsstaticip"
  keypairname = "id_rsa" 
}

