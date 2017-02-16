output "test_basic" {
  value = "${data.template_file.basic.rendered}"
}

output "test_fmt" {
  value = "${data.template_file.fmt.rendered}"
}
