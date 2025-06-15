terraform {
  backend "s3" {
    bucket  = "dheerendraS-backend-2025"
    key     = "terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
