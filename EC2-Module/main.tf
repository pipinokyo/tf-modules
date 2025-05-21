resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd php php-mysqlnd
    systemctl start httpd
    systemctl enable httpd
  EOF

  tags = merge(var.tags, {
    Name = "${var.tags["Name"]}-${var.service_name}"
  })

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
    tags        = var.tags
  }
} 