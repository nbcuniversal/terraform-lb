output "dns_name" {
  value = "${aws_alb.main.dns_name}"
}

output "zone_id" {
  value = "${aws_alb.main.zone_id}"
}

output "arn" {
  value = "${aws_alb.main.arn}"
}

output "http_listener_arn" {
  value = "${aws_alb_listener.http.arn}"
}

output "https_listener_arn" {
  value = "${aws_alb_listener.https.arn}"
}
