variable "key_pair_name" {
  type        = string
  description = "The name of the key pair to use for the instance"
}
variable "instance_count" {
  type        = number
  description = "The number of instances to create"
  default     = 1
}
variable "instance_type" {
  type        = string
  description = "The type of instance to create"
  default     = "t3.micro"
}
variable "ami_id" {
  type        = string
  description = "The AMI ID to use for the instance"
}
variable "availability_zone" {
  type        = string
  description = "The availability zone to launch the instance in"
  default     = "us-east-1a"
}
variable "subnet_id" {
  type        = string
  description = "The ID of the subnet to launch the instance in"
}
variable "root_volume_size" {
  type        = number
  description = "The size of the root volume in GB"
  default     = 30
}
variable "root_volume_type" {
  type        = string
  description = "The type of the root volume"
  default     = "gp3" 
}
variable "tags" {
  type        = map(string)
  description = "Tags to apply to the instance"
  default     = {
    Name        = "MyEC2Instance"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}