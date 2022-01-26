data "alicloud_mongodb_zones" "default" {
}

data "alicloud_cms_alarm_contact_groups" "default" {
}

module "vpc" {
  source             = "alibaba/vpc/alicloud"
  create             = true
  vpc_name           = var.name
  vpc_cidr           = "172.16.0.0/16"
  vswitch_name       = var.name
  vswitch_cidrs      = ["172.16.0.0/21"]
  availability_zones = [data.alicloud_mongodb_zones.default.zones.0.id]
}

module "mongodb_example" {
  source = "../../"

  # Mongodb Instance
  create = true

  name                 = var.name
  engine_version       = "4.0"
  instance_charge_type = var.instance_charge_type
  db_instance_class    = var.db_instance_class
  db_instance_storage  = var.db_instance_storage
  period               = var.period
  security_ip_list     = var.security_ip_list
  replication_factor   = var.replication_factor
  storage_engine       = "WiredTiger"
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  account_password     = var.account_password
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  tags                 = var.tags

  # cms_alarm
  enable_alarm_rule = false

}

module "use_existing_mongodb" {
  source = "../../"

  # Mongodb Instance
  create = false

  # cms_alarm
  enable_alarm_rule = var.enable_alarm_rule

  alarm_rule_name               = var.alarm_rule_name
  existing_instance_id          = module.mongodb_example.this_mongodb_instance_id
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval

}

module "mongodb_3_4_rocksdb" {
  source = "../../modules/mongodb-3.4-rocksdb"

  # Mongodb Instance
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  db_instance_class    = var.db_instance_class
  db_instance_storage  = var.db_instance_storage
  period               = var.period
  security_ip_list     = var.security_ip_list
  replication_factor   = var.replication_factor
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  account_password     = var.account_password
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  tags                 = var.tags

  # cms_alarm
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval

}

module "mongodb_3_4_wiredtiger" {
  source = "../../modules/mongodb-3.4-wiredtiger"

  # Mongodb Instance
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  db_instance_class    = var.db_instance_class
  db_instance_storage  = var.db_instance_storage
  period               = var.period
  security_ip_list     = var.security_ip_list
  replication_factor   = var.replication_factor
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  account_password     = var.account_password
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  tags                 = var.tags

  # cms_alarm
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval

}

module "mongodb_4_0_wiredtiger" {
  source = "../../modules/mongodb-4.0-wiredtiger"

  # Mongodb Instance
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  db_instance_class    = var.db_instance_class
  db_instance_storage  = var.db_instance_storage
  period               = var.period
  security_ip_list     = var.security_ip_list
  replication_factor   = var.replication_factor
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  account_password     = var.account_password
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  tags                 = var.tags

  # cms_alarm
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval

}

module "mongodb_4_2_wiredtiger" {
  source = "../../modules/mongodb-4.2-wiredtiger"

  # Mongodb Instance
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  db_instance_class    = var.db_instance_class
  db_instance_storage  = var.db_instance_storage
  period               = var.period
  security_ip_list     = var.security_ip_list
  replication_factor   = var.replication_factor
  vswitch_id           = module.vpc.this_vswitch_ids[0]
  zone_id              = data.alicloud_mongodb_zones.default.zones.0.id
  account_password     = var.account_password
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  tags                 = var.tags

  # cms_alarm
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_contact_groups     = data.alicloud_cms_alarm_contact_groups.default.names
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  alarm_rule_effective_interval = var.alarm_rule_effective_interval

}