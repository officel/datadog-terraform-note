resource "datadog_timeboard" "project-tb" {
  title       = "${var.title}"
  description = "${var.description}"
  read_only   = "${var.read_only}"

  template_variable {
    name    = "${var.template_name}"
    prefix  = "${var.template_name}"
    default = "${var.template_default}"
  }

  # LA 3 Lines
  graph {
    title = "system.load"
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




}

