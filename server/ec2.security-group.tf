resource "aws_security_group" "allow_ssh" {
  name        = var.ec2_resources.ssh_security_group
  description = "allow ssh inbound traffic"
  vpc_id      = data.aws_vpc.this.id

ingress {
    description = "SSH from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [var.ec2_resources.ssh_source_ip]
}

egress {
    description = "SSH from VPC"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
}

  tags = merge(var.tags, {Name = var.ec2_resources.ssh_security_group})
}

