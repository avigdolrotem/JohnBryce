resource "aws_instance" "this" {
  ami           = data.aws_ami.amazon_linux.id
  count         = var.instance_count
  availability_zone = data.aws_availability_zones.available.names[0]
  instance_type = var.instance_type
  key_name      = var.key_pair_name
  subnet_id     = data.aws_subnet.private.id
  security_groups = [aws_security_group.this.name]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "MyEC2Instance"
  }
}

module "security_group" {
  source = "./security_group"

  sg_name              = "demo-sg"
  sg_description       = "Demo Security Group"
  sg_tags              = {
    Name        = "Demo-SG"
    ManagedBy   = "Terraform"
  }
}

