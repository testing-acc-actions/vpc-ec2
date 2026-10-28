terraform {
  backend "s3" {
    bucket       = "tfstate-vpc-ec"
    key          = "vpc-ec2-project/terraform.tfstate"
    region       = "ap-south-1"
    profile      = "terraform-vpc-ec2"
    use_lockfile = true
    encrypt      = true
  }
}