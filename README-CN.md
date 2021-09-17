terraform-alicloud-mongodb
=====================================================================


本 Module 用于在阿里云的 VPC 下创建一个[MongoDB云数据库](https://help.aliyun.com/document_detail/26558.html). 

本 Module 支持创建以下资源:

* [MongoDB 数据库实例 (mongodb instance)](https://www.terraform.io/docs/providers/alicloud/r/mongodb_instance.html)
* [CmsAlarm 云监控实例 (cms_alarm)](https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html)

## 用法

#### 创建新的Mongodb实例

```hcl
module "mongodb" {
  source               = "terraform-alicloud-modules/mongodb/alicloud"
  ###################
  # MongoDB Instance
  ###################
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
  alarm_rule_contact_groups  = ["AccCms"]
  enable_alarm_rule          = true
}
```

### 使用已经存在的Mongodb实例

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

## 示例

* [创建 Mongodb 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/examples/complete)
* [使用已经存在的 Mongodb 实例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/examples/using-existing-mongocb-instance)
* [使用子模块实例创建 Mongodb 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/examples/using-submodule-complete)

## 模块

* [mongodb-3.4-rocksdb](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-3.4-rocksdb)
* [mongodb-3.4-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-3.4-wiredtiger)
* [mongodb-4.0-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-4.0-wiredtiger)
* [mongodb-4.2-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-4.2-wiredtiger)


## 注意事项
本Module从版本v1.4.0开始已经移除掉如下的 provider 的显示设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/mongodb"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.3.0:

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

如果你想对正在使用中的Module升级到 1.4.0 或者更高的版本，那么你可以在模板中显示定义一个系统过Region的provider：
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
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显示指定这个provider：

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

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.56.0 |

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


