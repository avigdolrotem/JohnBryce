resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = data.aws_vpc.this.id

  tags = var.sg_tags
}

resource "aws_security_group_rule" "ingress" {
  type              = "ingress"
  description       = "Allow inbound traffic"
  security_group_id = aws_security_group.this.id
  from_port         = var.ingress_from_port
  to_port           = var.ingress_to_port
  protocol          = var.ingress_ip_protocol
  cidr_blocks       = [var.ingress_ipv4_cidr]
}

resource "aws_security_group_rule" "egress" {
  type              = "egress"
  description       = "Allow outbound traffic"
  security_group_id = aws_security_group.this.id
  from_port         = var.egress_from_port
  to_port           = var.egress_to_port
  protocol          = var.egress_ip_protocol
  cidr_blocks       = [var.egress_ipv4_cidr]
}