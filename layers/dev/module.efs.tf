module "efs" {
  source = "../../modules/efs"
  region = "${var.region}"
  availability_zones = "us-east-2a"
 // kms_key_id = "${module.efs.kms_arn}"
 
}
