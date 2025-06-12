terraform {
  backend "s3" {
    bucket         = "dheerendra-backend-2025"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}
