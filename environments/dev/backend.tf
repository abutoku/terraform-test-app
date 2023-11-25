terraform {
  backend "s3" {
    bucket = "s3-bucket-name"
    key    = "statefile_path"
    region = "ap-northeast-1"
  }
}
