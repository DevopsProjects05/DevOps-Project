terraform {
  backend "s3" {
    bucket = "euran-terraform-statefile-1"
    key = "server_name/statefile"
    region = "ap-south-1"
  }
}  
