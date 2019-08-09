module "alb-asg" {
  source = "../../modules/alb-asg"
  name_prefix            = "${var.name_prefix}"
  image_id               = "${var.image_id}"
  instance_type          = "${var.instance_type}"
 // key_name               = "${var.key_name}"
 // availability_zones     = "us-east-2a"
  subnets                = "${var.subnets}"
  certificate_arn        = "${var.certificate_arn}"
  ssl_policy             = "${var.ssl_policy}"
}