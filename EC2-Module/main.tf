resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name              = var.key_name
  vpc_security_group_ids = var.security_group_ids

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install -y php7.4
    yum install -y httpd mariadb
    systemctl enable httpd
    systemctl start httpd
    cd /var/www/html
    wget https://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    cp -r wordpress/* .
    chown -R apache:apache /var/www/html
    systemctl restart httpd
  EOF

  tags = merge(var.tags, {
    Name = "${var.tags["Name"]}-ec2"
  })

  root_block_device {
    volume_size = 20
    volume_type = "gp2"
    tags = var.tags
  }
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

output "instance_id" {
  value = aws_instance.this.id
} 