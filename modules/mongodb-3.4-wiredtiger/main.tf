provider "alicloud" {
  version                 = ">=1.64.0"
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/mongodb"
}
locals {
  engine_version = "3.4"
  storage_engine = "WiredTiger"
}
module "mongodb" {
  source               = "../../"
  region               = var.region
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
}

