//ec2
region = "us-east-2"
//availability_zones = "us-east-2a"
ami = "ami-02f706d959cedf892"
instance_type = "t2.micro"

//rds

engine = "mysql"
engine_version = "5.7"
instance_class = "db.t2.micro"
username = "user"
password = "password"


name_prefix      =  "terraform_asg_launch"
image_id         =  "ami-02f706d959cedf892"
#APPLICATION LOAD BALANCER PARAMETERS
subnets=["subnet-a03939c8", "subnet-3799e74d"]
certificate_arn   = "arn:aws:acm:us-east-2:378808291776:certificate/08e0eec5-7140-4e24-a295-d59a94c8f97c"
ssl_policy        = "ELBSecurityPolicy-2016-08"
key_name = "terraform"