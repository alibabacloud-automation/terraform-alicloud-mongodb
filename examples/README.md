# Complete MongoDB example

Configuration in this directory creates set of RDS resources including DB instance, DB account and Datebase.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example may create resources which cost money. Run `terraform destroy` when you don't need these resources.


## Outputs

| Name                          | Description                      |
| ----------------------------- | -------------------------------- |
| this_db_instance_id           | instance ID created              |
| this_db_instance_name         | instance name configured         |
| this_db_instance_security_ips | instance security ips configured |
| this_db_instance_zone_id      | instance zone ID created         |
| this_db_instance_vswitch_id   | instance vswitch ID created      |

