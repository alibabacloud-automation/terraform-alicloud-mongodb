locals {
  #instance
  this_instance_id = var.existing_instance_id != "" ? var.existing_instance_id : concat(alicloud_mongodb_instance.this.*.id, [""])[0]
}
