terraform {
  backend "s3" {
    bucket = "terraform-state-makinay"
    key    = "Homolog/terraform.tfstate"
    region = "us-east-2"
  }
}
