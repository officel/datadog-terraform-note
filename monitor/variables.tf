variable "project" {
  default = "proj"
}

variable "notify" {
  description = "Notification email, hipchat or slack user/channel"
  default     = ""
}

variable "escalation_notify" {
  description = "Escalation notification email, hipchat or slack user/channel"
  default     = ""
}

