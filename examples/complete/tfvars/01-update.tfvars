# Mongodb Instance
name                = "update-tf-mongodb-name"
db_instance_class   = "dds.mongo.standard"
db_instance_storage = 30
period              = 2
security_ip_list    = ["10.23.12.24"]
account_password    = "YourPassword123!update"
backup_period       = ["Tuesday"]
backup_time         = "00:00Z-01:00Z"
tags = {
  Name = "UpdateMongodb"
}

# cms_alarm
enable_alarm_rule             = false
alarm_rule_name               = "update-tf-alarm-rule-nam"
alarm_rule_statistics         = "Maximum"
alarm_rule_operator           = "<="
alarm_rule_threshold          = "35"
alarm_rule_triggered_count    = "5"
alarm_rule_period             = "900"
alarm_rule_silence_time       = 10000
alarm_rule_effective_interval = "1:00-3:00"