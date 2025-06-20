aws_region        = "eu-west-1"
vpc_cidr          = "10.2.0.0/16"
public_subnet_cidr = "10.2.1.0/24"
instance_type     = "t3.medium"
ami_id            = "ami-xxxxxxxxxxxxxxxxx"  # AMI prod à mettre


#terraform apply -var-file="prod.tfvars"