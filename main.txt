module "sg" {
  source            = "./security_group"
  sg_name           = "Danny-SG-dev"
  ingress_ipv4_cidr = "10.100.0.0/24"
  ingress_from_port = 80
}

