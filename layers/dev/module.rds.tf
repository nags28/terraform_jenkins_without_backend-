module "rds" {
  source = "../../modules/rds"
  region = "${var.region}"
   availability_zones = "us-east-2a"
   engine = "${var.engine}"
    engine_version = "${var.engine_version}"
    instance_class = "${var.instance_class}"
    username = "${var.username}"
    password = "${var.password}"
  
}
