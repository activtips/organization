terraform {
  backend "s3" {
    bucket         = "mohamed-tf-state-eu-west-3-prod"
    key            = "org/accounts/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
