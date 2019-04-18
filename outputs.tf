output "this_db_instance_id" {
  value = "${alicloud_mongodb_instance.this_instance.id}"
}

output "this_db_instance_name" {
  value = "${alicloud_mongodb_instance.this_instance.name}"
}

output "this_db_instance_zone_id" {
  value = "${alicloud_mongodb_instance.this_instance.zone_id}"
}

output "this_db_instance_vswitch_id" {
  value = "${alicloud_mongodb_instance.this_instance.vswitch_id}"
}

output "this_db_instance_security_ip_list" {
  value = "${alicloud_mongodb_instance.this_instance.security_ip_list}"
}
