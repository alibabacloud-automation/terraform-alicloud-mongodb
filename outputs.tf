#################
# MongoDB Instance
#################
output "this_mongodb_instance_id" {
  description = "The ID of the MongoDB instance. "
  value       = local.this_instance_id
}

output "this_mongodb_instance_engine_version" {
  description = "The engine version of the MongoDB instance. "
  value       = concat(alicloud_mongodb_instance.this.*.engine_version, [""])[0]
}

output "this_mongodb_instance_charge_type" {
  description = "The billing method of the instance. "
  value       = concat(alicloud_mongodb_instance.this.*.instance_charge_type, [""])[0]
}

output "this_mongodb_instance_period" {
  description = "The duration that you will buy MongoDB instance. "
  value       = concat(alicloud_mongodb_instance.this.*.period, [""])[0]
}

output "this_mongodb_instance_zone_id" {
  description = "The Zone to launch the MongoDB instance. "
  value       = concat(alicloud_mongodb_instance.this.*.zone_id, [""])[0]
}
output "this_mongodb_instance_vswitch_id" {
  description = "The virtual switch ID to launch MongoDB instances in one VPC. "
  value       = concat(alicloud_mongodb_instance.this.*.vswitch_id, [""])[0]
}

output "this_mongodb_instance_tags" {
  description = "A mapping of tags to assign to the MongoDB instance resource. "
  value       = alicloud_mongodb_instance.this.*.tags
}
output "this_mongodb_instance_storage" {
  description = "User-defined DB instance storage space. "
  value       = concat(alicloud_mongodb_instance.this.*.db_instance_storage, [""])[0]
}
output "this_mongodb_instance_class" {
  description = "The class of MongoDB instance"
  value       = concat(alicloud_mongodb_instance.this.*.db_instance_class, [""])[0]
}

output "this_mongodb_instance_storage_engine" {
  description = "The storage engine used by the MongoDB instance. "
  value       = concat(alicloud_mongodb_instance.this.*.storage_engine, [""])[0]
}
output "this_mongodb_instance_name" {
  description = "The name of MongoDB instance. "
  value       = concat(alicloud_mongodb_instance.this.*.name, [""])[0]
}
output "this_mongodb_instance_security_ip_list" {
  description = "IP whitelist of MongoDB instances. "
  value       = alicloud_mongodb_instance.this.*.security_ip_list
}

output "this_mongodb_instance_replication_factor" {
  description = "Number of replica set nodes. "
  value       = concat(alicloud_mongodb_instance.this.*.replication_factor, [""])[0]
}

output "this_mongodb_instance_backup_period" {
  description = "The MongoDB instance backup period. "
  value       = alicloud_mongodb_instance.this.*.backup_period
}

output "this_mongodb_instance_backup_time" {
  description = "The MongoDB instance backup time. "
  value       = concat(alicloud_mongodb_instance.this.*.backup_time, [""])[0]
}

#################
# Deprecated outputs
#################
output "this_db_instance_id" {
  description = "`(Deprecated)` It has been deprecated from version 1.2.0 and use `this_Mongodb_instance_id` instead. "
  value       = local.this_instance_id
}
output "this_db_instance_name" {
  description = "`(Deprecated)` It has been deprecated from version 1.2.0 and use `this_mongodb_instance_name` instead. "
  value       = concat(alicloud_mongodb_instance.this.*.name, [""])[0]
}
output "this_db_instance_zone_id" {
  description = "`(Deprecated)` It has been deprecated from version 1.2.0 and use `this_mongodb_instance_zone_id` instead. "
  value       = concat(alicloud_mongodb_instance.this.*.zone_id, [""])[0]
}
output "this_db_instance_vswitch_id" {
  description = "`(Deprecated)` It has been deprecated from version 1.2.0 and use `this_mongodb_instance_vswitch_id` instead. "
  value       = concat(alicloud_mongodb_instance.this.*.vswitch_id, [""])[0]
}
output "this_db_instance_security_ip_list" {
  description = "`(Deprecated)` It has been deprecated from version 1.2.0 and use `this_mongodb_instance_security_ip_list` instead. "
  value       = alicloud_mongodb_instance.this.*.security_ip_list
}