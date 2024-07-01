terraform {
  backend "s3" {
    bucket = "terraform-state-makinay"
    key    = "Prod/terraform.tfstate"
    region = "us-west-2"
  }
}
