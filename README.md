# terraform-alicloud-mongodb

Terraform module which creates MongoDB instance on Alibaba Cloud

## mongodb replica instance

Terraform module which creates MongoDB replica instance resources on Alibaba Cloud

These types of resources are supported:

- [mongodb_instance] (https://www.terraform.io/docs/providers/alicloud/r/mongodb_instance.html)

## Usage

You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

```tf
module "mongodb_instance" {
  source               = "terraform-alicloud-modules/mongodb/alicloud"
  engine_version       = "${var.engine_version}"
  db_instance_class    = "${var.db_instance_class}"
  db_instance_storage  = "${var.db_instance_storage}"
  name                 = "${var.name}"
  instance_charge_type = "${var.instance_charge_type}"
  vswitch_id           = "${var.vswitch_id}"
  security_ip_list     = "${var.security_ip_list}"
}
```

1. Setting `access_key` and `secret_key` values through environment variables:

   - ALICLOUD_ACCESS_KEY
   - ALICLOUD_SECRET_KEY
   - ALICLOUD_REGION

## Input

| Name                 | Description                                                                                                                                                                                                                                                                                                                                                       |  Type  |  Default   | Required |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :----: | :--------: | :------: |
| engine_version       | Database version. Value options:3.4 3.6 4.0                                                                                                                                                                                                                                                                                                                       | string |     ""     |   yes    |
| instance_type        | DB Instance type. For details, see [Instance type table](https://www.alibabacloud.com/help/doc-detail/57141.htm).                                                                                                                                                                                                                                                 | string |     ""     |   yes    |
| instance_storage     | User-defined DB instance storage space. Value range:[10,2000] Increase progressively at a rate of 5 GB. For details, see [Instance type table](https://www.alibabacloud.com/help/doc-detail/26312.htm).                                                                                                                                                           | string |     10     |   yes    |
| instance_name        | The name of DB instance. It a string of 2 to 256 characters.                                                                                                                                                                                                                                                                                                      | string |     ""     |    no    |
| instance_charge_type | Valid values are PrePaid, PostPaid, Default to PostPaid.                                                                                                                                                                                                                                                                                                          | string |  PostPaid  |    no    | "PostPaid" |
| zone_id              | The Zone to launch the DB instance. From version 1.8.1, it supports multiple zone. If it is a multi-zone and vswitch_id is specified, the vswitch must in the one of them. The multiple zone ID can be retrieved by setting multi to "true" in the data source alicloud_zones.                                                                                    | string |     ""     |    no    |
| vswitch_id           | VSwitch ID. If the instance type is VPC, this parameter cannot be left blank.                                                                                                                                                                                                                                                                                     | string |     ""     |    no    |
| security_ip_list     | List of IP addresses allowed to access all databases of an instance. The list contains up to 1,000 IP addresses, separated by commas. Supported formats include 0.0.0.0/0, 10.23.12.24 (IP), and 10.23.12.24/24 (Classless Inter-Domain Routing (CIDR) mode. /24 represents the length of the prefix in an IP address. The range of the prefix length is [1,32]). |  list  |    [ ]     |    no    |
| vswitch_id           | VSwitch ID. If the instance type is VPC, this parameter cannot be left blank.                                                                                                                                                                                                                                                                                     | string |     ""     |    no    |
| storage_engine       | Storage engine; optional values: WiredTiger or RocksDB.                                                                                                                                                                                                                                                                                                           | string | WiredTiger |    no    |
| replication_factor   | Number of replica set nodes. Valid values: [3,5,7]                                                                                                                                                                                                                                                                                                                |  int   |     3      |    no    |
| account_password     | Password of the root account                                                                                                                                                                                                                                                                                                                                      | string |     ""     |    no    |

## Outputs

| Name                          | Description                      |
| ----------------------------- | -------------------------------- |
| this_db_instance_id           | instance ID created              |
| this_db_instance_name         | instance name configured         |
| this_db_instance_security_ips | instance security ips configured |
| this_db_instance_zone_id      | instance zone ID created         |
| this_db_instance_vswitch_id   | instance vswitch ID created      |