output "this_mongodb_instance_id" {
  value = "${module.mongodb_instance.this_db_instance_id}"
}

output "this_mongodb_instance_name" {
  value = "${module.mongodb_instance.this_db_instance_name}"
}

output "this_mongodb_instance_zone_id" {
  value = "${module.mongodb_instance.this_db_instance_zone_id}"
}

output "this_mongodb_instance_vswitch_id" {
  value = "${module.mongodb_instance.this_db_instance_vswitch_id}"
}

output "this_mongodb_instance_security_ip_list" {
  value = "${module.mongodb_instance.this_db_instance_security_ip_list}"
}
