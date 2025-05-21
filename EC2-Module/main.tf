resource "aws_instance" "this" {                          # "aws_instance" is the resource type for EC2 instances in the AWS provider."this" is the local name for this resource (used to reference it elsewhere in the configuration)
  ami                    = var.ami_id                     # The AMI ID to use for the instance. This is a required argument. defined in the variables.tf file.
  instance_type          = var.instance_type              # The instance type to use for the instance. This is a required argument. defined in the variables.tf file.
  key_name               = var.key_name                   # The key pair name to use for the instance. This is a required argument. defined in the variables.tf file.
  vpc_security_group_ids = var.security_group_ids         # The security group IDs to associate with the instance. This is a required argument. defined in the variables.tf file.

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd php php-mysqlnd
    systemctl start httpd
    systemctl enable httpd
  EOF

  tags = merge(var.tags, {                                 # Merge the tags passed to the module with the instance-specific tags
    Name = "${var.tags["Name"]}-${var.service_name}"       # The name of the instance, which is a combination of the Name tag and the service name.
  })

  root_block_device {                                      # Defines the root block device for the instance. This is a required block. 
    volume_size = 8                                        # The size of the root volume in GiB. This is a required argument.  
    volume_type = "gp2"                                    # The type of the root volume. This is a required argument.
    tags        = var.tags                                 # The tags to apply to the root volume. This is a required argument.
  }
} 