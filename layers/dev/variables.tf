variable "region" {
  description = "Region"
}
//variable "availability_zones" {
//  description = "Availability zones that are going to be used for the subnets"
//  type        = "list"
//}

variable "ami" {
    description = "ami id"
    //default = ""
    type = "string"
}

variable "instance_type" {
    description = "instance_type t2.micro"
    //default = "false"
    type = "string"
  
}


variable "engine" {
    description = "engine "
    //default = ""
    type = "string"
}

variable "engine_version" {
    description = "engine_version"
    //default = ""
    type = "string"
}

variable "instance_class" {
    description = "instance_class"
    //default = ""
    type = "string"
}

variable "username" {
    description = "username for db"
    //default = ""
    type = "string"
}

variable "password" {
    description = "password for db "
    //default = ""
    type = "string"
}

//variable "aws_accesskey" {
//   type = "string"
//}
//variable "aws_secretkey" {
//   type = "string"
//}

variable "name_prefix" {
description ="name of launch configuration"
}

variable "image_id" {
  description ="ami to attach autoscaling group"
}


variable "subnets" {
  description= "list of subnets"
}
variable "certificate_arn" {
  default="https self signed certificate arn"
}

variable "ssl_policy" {
  description="ssl policy"
}