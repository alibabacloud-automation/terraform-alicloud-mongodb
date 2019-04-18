##############################################################
#variables for alicloud_mongodb_instance
##############################################################

variable "engine_version" {
  description = "The engine version to use"
}

variable "db_instance_storage" {
  description = "The allocated storage in gigabytes"
}

variable "db_instance_class" {
  description = "DB Instance type, for example: dds.mongo.mid. fall list is : https://www.alibabacloud.com/help/doc-detail/57141.html"
}

variable "storage_engine" {
  description = "The MongoDB storage engine, WiredTiger or RocksDB"
  default     = "WiredTiger"
}

variable "name" {
  description = " The name of DB instance. It a string of 2 to 256 characters"
}

variable "instance_charge_type" {
  description = "Valid values are Prepaid, PostPaid, Default to PostPaid"
  default     = "PostPaid"
}

variable "period" {
  description = "The duration that you will buy DB instance (in month). It is valid when instance_charge_type is PrePaid. Valid values: [1~9], 12, 24, 36. Default to 1"
  default=1
}

variable "zone_id" {
  description = "The Zone to launch the DB instance. "
  default=""
}

variable "vswitch_id" {
  description = "The VSwitch to launch the DB instance. "
}

variable "security_ip_list" {
  description = " List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32])."
  type        = "list"
  default     = []
}

variable "account_password" {
  description = "Password of the root account. It is a string of 6 to 32 characters and is composed of letters, numbers, and underlines"
  default     = ""
}

variable "replication_factor" {
  description = "Number of replica set nodes. Valid values: [3,5,7]"
  default     = 3
}
