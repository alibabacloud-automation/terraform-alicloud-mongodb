locals {
  engine_version = "4.0"
  storage_engine = "WiredTiger"
}
module "mongodb" {
  source = "../../"
  region = var.region

  ###################
  # Mongodb Instance
  ###################
  engine_version       = local.engine_version
  storage_engine       = local.storage_engine
  replication_factor   = var.replication_factor
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  db_instance_class    = var.db_instance_class
  db_instance_storage  = var.db_instance_storage
  period               = var.period
  security_ip_list     = var.security_ip_list
  vswitch_id           = var.vswitch_id
  zone_id              = var.zone_id
  account_password     = var.account_password
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  tags = merge(
    {
      EngineVersion = local.engine_version
      StorageEngine = local.storage_engine
    },
    var.tags
  )

  #############
  # cms_alarm
  #############
  alarm_rule_name               = var.alarm_rule_name
  alarm_rule_silence_time       = var.alarm_rule_silence_time
  enable_alarm_rule             = var.enable_alarm_rule
  alarm_rule_effective_interval = var.alarm_rule_effective_interval
  alarm_rule_statistics         = var.alarm_rule_statistics
  alarm_rule_period             = var.alarm_rule_period
  alarm_rule_operator           = var.alarm_rule_operator
  alarm_rule_threshold          = var.alarm_rule_threshold
  alarm_rule_triggered_count    = var.alarm_rule_triggered_count
  alarm_rule_contact_groups     = var.alarm_rule_contact_groups
}

