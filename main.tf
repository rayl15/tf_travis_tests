provider "aws" {
  region = "us-east-1"
}
data "template_file" "basic" {
  template = "${file("${path.module}/scripts/basic.sh")}"
}

data "template_file" "fmt" {
  template = "${file("${path.module}/scripts/fmt.sh")}"
}
