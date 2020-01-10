#################
# MongoDB Instance
#################
output "this_mongodb_instance_id" {
  description = "The ID of the MongoDB instance. "
  value       = module.mongodb.this_mongodb_instance_id
}

output "this_mongodb_instance_engine_version" {
  description = "The engine version of the MongoDB instance. "
  value       = module.mongodb.this_mongodb_instance_engine_version
}

output "this_mongodb_instance_charge_type" {
  description = "The billing method of the instance. "
  value       = module.mongodb.this_mongodb_instance_charge_type
}

output "this_mongodb_instance_period" {
  description = "The duration that you will buy MongoDB instance. "
  value       = module.mongodb.this_mongodb_instance_period
}

output "this_mongodb_instance_zone_id" {
  description = "The Zone to launch the MongoDB instance. "
  value       = module.mongodb.this_mongodb_instance_zone_id
}
output "this_mongodb_instance_vswitch_id" {
  description = "The virtual switch ID to launch MongoDB instances in one VPC. "
  value       = module.mongodb.this_mongodb_instance_vswitch_id
}

output "this_mongodb_instance_tags" {
  description = "A mapping of tags to assign to the MongoDB instance resource. "
  value       = module.mongodb.this_mongodb_instance_tags
}
output "this_mongodb_instance_storage" {
  description = "User-defined DB instance storage space. "
  value       = module.mongodb.this_mongodb_instance_storage
}
output "this_mongodb_instance_class" {
  description = "The class of MongoDB instance"
  value       = module.mongodb.this_mongodb_instance_class
}

output "this_mongodb_instance_storage_engine" {
  description = "The storage engine used by the MongoDB instance. "
  value       = module.mongodb.this_mongodb_instance_storage_engine
}
output "this_mongodb_instance_name" {
  description = "The name of MongoDB instance. "
  value       = module.mongodb.this_mongodb_instance_name
}
output "this_mongodb_instance_security_ip_list" {
  description = "IP whitelist of MongoDB instances. "
  value       = module.mongodb.this_mongodb_instance_security_ip_list
}

output "this_mongodb_instance_replication_factor" {
  description = "Number of replica set nodes. "
  value       = module.mongodb.this_mongodb_instance_replication_factor
}

output "this_mongodb_instance_backup_period" {
  description = "The MongoDB instance backup period. "
  value       = module.mongodb.this_mongodb_instance_period
}

output "this_mongodb_instance_backup_time" {
  description = "The MongoDB instance backup time. "
  value       = module.mongodb.this_mongodb_instance_backup_time
}
