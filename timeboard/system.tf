resource "datadog_timeboard" "system" {
  title       = "${var.title}"
  description = "${var.description}"
  read_only   = "${var.read_only}"

  template_variable {
    name    = "${var.template_name}"
    prefix  = "${var.template_name}"
    default = "${var.template_default}"
  }

  # Uptime Value
  graph {
    title = "Uptime"
    viz   = "query_value"
    autoscale = true
    "request" {
      q = "avg:system.uptime{$$${var.template_name}}"
      aggregator = "max"
    }
  }

  # LA 3 Lines
  graph {
    title = "System.load"
    viz   = "timeseries"

    request {
      q    = "avg:system.load.1{$$${var.template_name}}"
      type = "line"
    }

    request {
      q    = "avg:system.load.5{$$${var.template_name}}"
      type = "line"
    }

    request {
      q    = "avg:system.load.15{$$${var.template_name}}"
      type = "line"
    }
  }

  # CPU Usage
  graph {
    title = "CPU usage (%)"
    viz   = "timeseries"
    autoscale = true
    request {
      q    = "avg:system.cpu.idle{$$${var.template_name}}, avg:system.cpu.system{$$${var.template_name}}, avg:system.cpu.iowait{$$${var.template_name}}, avg:system.cpu.user{$$${var.template_name}}, avg:system.cpu.stolen{$$${var.template_name}}, avg:system.cpu.guest{$$${var.template_name}}"
      type = "area"
      style {
        palette = "classic"
      }
    }
  }

}

