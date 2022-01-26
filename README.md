Terraform module which creates MongoDB instance on Alibaba Cloud  
terraform-alicloud-mongodb
=====================================================================

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/blob/master/README-cn.md)

Terraform module which creates MongoDB replica instance resources on Alibaba Cloud

These types of resources are supported:

* [Alicloud mongodb instance](https://www.terraform.io/docs/providers/alicloud/r/mongodb_instance.html)
* [Alicloud_cms_alarm](https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html)

----------------------


## Usage

-----

For new instance

```hcl
module "mongodb" {
  source               = "terraform-alicloud-modules/mongodb/alicloud"

  #################
  # MongoDB Instance
  #################
  engine_version       = "3.4"
  storage_engine       = "RocksDB"
  replication_factor   = 3
  name                 = "my-mongo"
  instance_charge_type = "PostPaid"
  db_instance_class    = "dds.mongo.mid"
  db_instance_storage  = 10
  period               = 1
  security_ip_list     = ["1.1.1.1", "2.2.2.2", "3.3.3.3"]
  vswitch_id           = "vsw-uf6ocf31lyoqvw2jmmr9f"
  zone_id              = "cn-shanghai-b"
  account_password     = "mongo123"
  backup_period        = ["Monday", "Wednesday", "Friday"]
  backup_time          = "02:00Z-03:00Z"
  tags = {
    Env      = "Private"
    Location = "Secret"
  }

  #############
  # cms_alarm
  #############
  alarm_rule_name            = "CmsAlarmForMongodb"
  alarm_rule_statistics      = "Average"
  alarm_rule_period          = 300
  alarm_rule_operator        = "<="
  alarm_rule_threshold       = 35
  alarm_rule_triggered_count = 2
  alarm_rule_contact_groups  = ["Mongodb", "AccCms"]
}
```

For existing instance

```hcl
module "mongodb_example" {
  source               = "terraform-alicloud-modules/mongodb/alicloud"

  ###################
  # Mongodb Instance
  ###################
  existing_instance_id = "dds-uf694de619xxxxx"

  #############
  # cms_alarm
  #############
  alarm_rule_name            = "CmsAlarmForMongodb"
  alarm_rule_statistics      = "Average"
  alarm_rule_period          = 300
  alarm_rule_operator        = "<="
  alarm_rule_threshold       = 35
  alarm_rule_triggered_count = 2
  alarm_rule_contact_groups  = ["AccCms"]
  enable_alarm_rule          = true
}
```

## Examples

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/examples/complete)
* [using-existing-mongodb-instance](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/examples/using-existing-mongocb-instance)
* [using-submodule-complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/examples/using-submodule-complete)

## Modules

* [mongodb-3.4-rocksdb](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-3.4-rocksdb)
* [mongodb-3.4-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-3.4-wiredtiger)
* [mongodb-4.0-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-4.0-wiredtiger)
* [mongodb-4.2-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-4.2-wiredtiger)

## Notes
From the version v1.4.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/mongodb"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.3.0:

```hcl
module "mongodb" {
  source  = "terraform-alicloud-modules/mongodb/alicloud"
  version     = "1.3.0"
  region      = "cn-shanghai"
  profile     = "Your-Profile-Name"
  engine_version       = "3.4"
  storage_engine       = "RocksDB"
  // ...
}
```

If you want to upgrade the module to 1.4.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-shanghai"
  profile = "Your-Profile-Name"
}
module "mongodb" {
  source  = "terraform-alicloud-modules/mongodb/alicloud"
  engine_version       = "3.4"
  storage_engine       = "RocksDB"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-shanghai"
  profile = "Your-Profile-Name"
  alias   = "sh"
}
module "mongodb" {
  source  = "terraform-alicloud-modules/mongodb/alicloud"
  providers = {
    alicloud = alicloud.sh
  }
  engine_version       = "3.4"
  storage_engine       = "RocksDB"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.56.0 |

Authors
---------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)