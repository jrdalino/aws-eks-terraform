output "vpc_id" {
  value = "${aws_vpc.this.id}"
}

output "gateway_subnet_ids" {
  value = "${aws_subnet.gateway.*.id}"
}

output "application_subnet_ids" {
  value = "${aws_subnet.application.*.id}"
}

output "database_subnet_ids" {
  value = "${aws_subnet.database.*.id}"
}

output "app_gtwy_subnet_ids" {
  value = "${concat(aws_subnet.gateway.*.id, aws_subnet.application.*.id)}"
}