Terraform module which creates MongoDB instance resources on Alibaba Cloud  
terraform-alicloud-mongodb
=====================================================================


本 Module 用于在阿里云的 VPC 下创建一个[MongoDB云数据库](https://help.aliyun.com/document_detail/26558.html). 

本 Module 支持创建以下资源:

* [MongoDB 数据库实例 (mongodb instance)](https://www.terraform.io/docs/providers/alicloud/r/mongodb_instance.html)

## Terraform 版本

本模板要求使用版本 Terraform 0.12。

## 用法

```hcl
module "mongodb" {
  source               = "terraform-alicloud-modules/mongodb/alicloud"
  region               = "cn-shanghai"
  #################
  # MongoDB Instance
  #################
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
}
```

## 示例

* [MongoDB 实例完整创建示例创建示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/examples/mongodb)

## 模块

* [mongodb-3.4-rocksdb](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-3.4-rocksdb)
* [mongodb-3.4-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-3.4-wiredtiger)
* [mongodb-4.0-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-4.0-wiredtiger)
* [mongodb-4.2-wiredtiger](https://github.com/terraform-alicloud-modules/terraform-alicloud-mongodb/tree/master/modules/mongodb-4.2-wiredtiger)


## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

作者
-------
Created and maintained by Yi Jincheng(yi785301535@163.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)


