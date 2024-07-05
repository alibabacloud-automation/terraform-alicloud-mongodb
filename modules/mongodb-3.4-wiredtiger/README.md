# Deprecated

This submodule is deprecated because of the [End of sale for MongoDB 3.4 instances](https://www.alibabacloud.com/help/en/mongodb/product-overview/notice-end-of-sale-for-mongodb-3-4-instances-20230101)

# Alibaba Cloud MongoDB-3.4-WiredTiger Terraform Module

Configuration in this directory creates set of MongoDB resources instance

## Usage

To run this example you need to execute:

```bash
module "mongodb" {
  source  = "terraform-alicloud-modules/mongodb/alicloud//modules/mongodb-3.4-wiredtiger"
  version = "~> 1.2"

  # omitted...
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
