variable "region" {
  default = "cn-shanghai"
}
provider "alicloud" {
  region = var.region
}
locals {
  engine_version = "3.4"
  storage_engine = "RocksDB"
}
data "alicloud_vpcs" "default" {
  is_default = true
}
data "alicloud_zones" "default" {
  available_resource_creation = "MongoDB"
  multi                       = true
}
resource "alicloud_vswitch" "this" {
  name              = "mongodb_vpc"
  availability_zone = data.alicloud_zones.default.zones.0.multi_zone_ids.0
  vpc_id            = data.alicloud_vpcs.default.vpcs.0.id
  cidr_block        = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 5, 4)
}
module "mongodb_example" {
  source = "../../"
  region = var.region

  ####################
  # Mongodb Instance
  ####################
  engine_version       = local.engine_version
  storage_engine       = local.storage_engine
  replication_factor   = 3
  name                 = "my-mongo"
  instance_charge_type = "PostPaid"
  db_instance_class    = "dds.mongo.mid"
  db_instance_storage  = 10
  period               = 1
  security_ip_list     = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
  vswitch_id           = alicloud_vswitch.this.id
  zone_id              = data.alicloud_zones.default.zones.0.multi_zone_ids.0
  account_password     = "mongo123"
  backup_period        = ["Monday", "Wednesday", "Friday"]
  backup_time          = "02:00Z-03:00Z"
  tags = {
    Env      = "Private"
    Location = "Secret"
  }

  #############
  # cms_alarm
  #############
  alarm_rule_name            = "CmsAlarmForMongodb"
  alarm_rule_statistics      = "Average"
  alarm_rule_period          = 300
  alarm_rule_operator        = "<="
  alarm_rule_threshold       = 35
  alarm_rule_triggered_count = 2
  alarm_rule_contact_groups  = ["Mongodb", "AccCms"]
}