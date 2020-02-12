provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/mongodb"
}
locals {
  this_instance_id      = var.existing_instance_id != "" ? var.existing_instance_id : concat(alicloud_mongodb_instance.this.*.id, [""])[0]
  create_more_resources = var.existing_instance_id != "" || var.create ? true : false
  project               = "acs_mongodb"
}

resource "alicloud_mongodb_instance" "this" {
  count                = var.existing_instance_id != "" ? 0 : var.create ? 1 : 0
  engine_version       = var.engine_version
  name                 = var.name
  instance_charge_type = var.instance_charge_type
  db_instance_class    = var.db_instance_class
  db_instance_storage  = var.db_instance_storage
  period               = var.period
  security_ip_list     = var.security_ip_list
  replication_factor   = var.replication_factor
  storage_engine       = var.storage_engine
  vswitch_id           = var.vswitch_id
  zone_id              = var.zone_id
  account_password     = var.account_password
  backup_period        = var.backup_period
  backup_time          = var.backup_time
  tags                 = var.tags
}

resource "alicloud_cms_alarm" "cpu_utilization" {
  count   = local.create_more_resources && var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "CPUUtilization"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  statistics         = var.alarm_rule_statistics
  period             = var.alarm_rule_period
  operator           = var.alarm_rule_operator
  threshold          = var.alarm_rule_threshold
  triggered_count    = var.alarm_rule_triggered_count
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}
resource "alicloud_cms_alarm" "memory_utilization" {
  count   = local.create_more_resources && var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "MemoryUtilization"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  statistics         = var.alarm_rule_statistics
  period             = var.alarm_rule_period
  operator           = var.alarm_rule_operator
  threshold          = var.alarm_rule_threshold
  triggered_count    = var.alarm_rule_triggered_count
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}
resource "alicloud_cms_alarm" "disk_utilization" {
  count   = local.create_more_resources && var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "DiskUtilization"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  statistics         = var.alarm_rule_statistics
  period             = var.alarm_rule_period
  operator           = var.alarm_rule_operator
  threshold          = var.alarm_rule_threshold
  triggered_count    = var.alarm_rule_triggered_count
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}
resource "alicloud_cms_alarm" "intranet_in" {
  count   = local.create_more_resources && var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "IntranetIn"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  statistics         = var.alarm_rule_statistics
  period             = var.alarm_rule_period
  operator           = var.alarm_rule_operator
  threshold          = var.alarm_rule_threshold
  triggered_count    = var.alarm_rule_triggered_count
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}
resource "alicloud_cms_alarm" "intranet_out" {
  count   = local.create_more_resources && var.enable_alarm_rule ? 1 : 0
  enabled = var.enable_alarm_rule
  name    = var.alarm_rule_name
  project = local.project
  metric  = "IntranetOut"
  dimensions = {
    instanceId = local.this_instance_id
    device     = "/dev/vda1,/dev/vdb1"
  }
  statistics         = var.alarm_rule_statistics
  period             = var.alarm_rule_period
  operator           = var.alarm_rule_operator
  threshold          = var.alarm_rule_threshold
  triggered_count    = var.alarm_rule_triggered_count
  contact_groups     = var.alarm_rule_contact_groups
  silence_time       = var.alarm_rule_silence_time
  effective_interval = var.alarm_rule_effective_interval
}