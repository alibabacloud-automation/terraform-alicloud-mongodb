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
