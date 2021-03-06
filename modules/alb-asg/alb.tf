resource "aws_alb" "alb-demo" {
  name               = "alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = "${var.subnets}"
  security_groups    = ["${aws_security_group.ALLTRAFFIC1.id}"]
  depends_on =["aws_launch_configuration.launch_conf"]
  
}




resource "aws_alb_listener" "alb-list" {
  load_balancer_arn = "${aws_alb.alb-demo.arn}"
  port              = "443"
  ssl_policy        = "${var.ssl_policy}"
  protocol          = "HTTPS"
  certificate_arn   = "${var.certificate_arn}"
  depends_on = ["aws_alb.alb-demo","aws_alb_target_group.albtarget"]
   default_action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.albtarget.arn}"
  }

  }

resource "aws_lb_listener_rule" "path_based_routing" {
  listener_arn = "${aws_alb_listener.alb-list.arn}"
depends_on = ["aws_alb.alb-demo","aws_alb_target_group.albtarget1"]
  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.albtarget1.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/info.php"]
  }
}



resource "aws_alb_target_group" "albtarget" {
  name     = "albtarget"
  port     = "8080"
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  depends_on = ["aws_alb.alb-demo"]
  health_check {
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }
}


resource "aws_alb_target_group" "albtarget1" {
  name     = "albtarget1"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
  depends_on = ["aws_alb.alb-demo"]
  health_check {
    path                = "/info.php"
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
  }
}