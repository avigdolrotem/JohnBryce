variable "sg_name" {
  type = string
  description = "The name of this security group"
  default = "demo-sg"
}

variable "sg_description" {
  type = string
  description = "The description of this security group"
  default = "Demo Security Group"
}

variable "sg_tags" {
  type = map(string)
  description = "The Security Group tags"
  default = {
    "Name" = "Demo-SG"
    "Managed-By" = "Terraform"
  }
}

variable "ingress_ipv4_cidr" {
  type = string
  default = ""
  description = "Ingress Cidr for SG Rule"
}

variable "ingress_from_port" {
  type = number
  default = 0
  description = "Default From port"

}

variable "ingress_to_port" {
  type = number
  default = 80
  description = "Default To port"

}

variable "ingress_ip_protocol" {
  type = string
  default = "tcp"
  description = "Default IP protocol"

}

variable "egress_ip_protocol" {
  type = string
  default = "-1"
  description = "Default IP protocol"

}

variable "egress_ipv4_cidr" {
  type = string
  default = "0.0.0.0/0"
  description = "Default Egress SG rule"

}


variable "vpc_name" {
  type = string
  default = "jb-aws-vpc-vpc"
  description = "Name of VPC to draw information from"

}