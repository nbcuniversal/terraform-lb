resource "aws_alb" "main" {
  internal                   = "${var.internal_loadbalancer}"
  enable_deletion_protection = "${var.enable_deletion_protection}"

  security_groups = [
    "${aws_security_group.ingress.id}",
    "${aws_security_group.egress.id}",
  ]

  subnets = [
    "${split(",", var.subnet_ids)}",
  ]

  access_logs {
    bucket  = "${var.access_logs_bucket}"
    prefix  = "alb-${lower(var.budget)}-${lower(var.environment)}"
    enabled = "${var.access_logs_enabled}"
  }

  tags {
    Budget      = "${var.budget}"
    Environment = "${var.environment}"
  }

  lifecycle {
    create_before_destroy = "${var.lifecycle_create_before_destroy}"
  }
}

resource "aws_alb_target_group" "default" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

  tags {
    Budget       = "${var.budget}"
    Environment  = "${var.environment}"
    LoadBalancer = "${aws_alb.main.id}"
  }
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_alb.main.id}"
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.default.arn}"
    type             = "forward"
  }
}

resource "aws_alb_listener" "https" {
  load_balancer_arn = "${aws_alb.main.id}"
  port              = 443
  protocol          = "HTTPS"

  default_action {
    target_group_arn = "${aws_alb_target_group.default.arn}"
    type             = "forward"
  }
}
