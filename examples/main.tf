module "mongodb_instance" {
  source              = "../"
  engine_version      = "3.4"
  db_instance_class   = "dds.mongo.mid"
  db_instance_storage = 10
  security_ip_list    = ["10.168.1.12", "100.69.7.112"]
  name                = "my-mongodb"
  vswitch_id          = "${module.module_vpc.vswitch_ids}"
}

module "module_vpc" {
  source        = "alibaba/vpc/alicloud"
  vpc_name      = "my_module_vpc"
  vswitch_name  = "my_module_vswitch"
  vswitch_cidrs = ["172.16.1.0/24"]
}

// Zones data source for availability_zone
data "alicloud_zones" "default" {
  available_resource_creation = "MongoDB"
}
