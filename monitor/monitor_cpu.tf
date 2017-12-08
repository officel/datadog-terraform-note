# DataDog Monitor

resource "datadog_monitor" "cpu" {
  // no create
  count = 1
  // Title
  name = "[terraform] [${var.project}] [system.cpu.system]"

  // Choose the detection method
  type = "query alert"

  // Define the metric
  query = "avg(last_5m):avg:system.cpu.system{project:${var.project}} by {host} > 8"

  // Set alert conditions
  thresholds {
    critical = "8"
    warning  = "6"
    ok       = "5"
  }
  require_full_window = false
  notify_no_data = false
  no_data_timeframe = 10
  timeout_h = 1
  new_host_delay = "300"
  evaluation_delay = 0
  
  // Say what's happening
  message = <<EOF
  CPU使用率が高いホスト {host.name} ({host.ip})
  ${var.notify}
  EOF

  renotify_interval = "60"

  escalation_message = <<EOF
  High CPU usage for last 5m on host {host.name} ({host.ip}) hasn't been solved ${var.escalation_notify}
  EOF

  // Notify your team
  notify_audit = false
  locked = true

  // other
  tags = ["${var.project}"]
}

