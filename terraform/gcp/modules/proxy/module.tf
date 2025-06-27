resource "google_compute_health_check" "back" {
  name               = "back-http-basic-check"
  check_interval_sec = 5
  healthy_threshold  = 2
  http_health_check {
    port               = 3001
    port_specification = "USE_FIXED_PORT"
    proxy_header       = "NONE"
    request_path       = "/"
  }
  timeout_sec         = 5
  unhealthy_threshold = 2
}

## back
resource "google_compute_backend_service" "back" {
  name                            = "back-backend-service"
  connection_draining_timeout_sec = 0
  health_checks                   = [google_compute_health_check.back.id]
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  port_name                       = "http-back"
  protocol                        = "HTTP"
  session_affinity                = "NONE"
  timeout_sec                     = 30
  backend {
    group           = var.back_group.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

resource "google_compute_url_map" "back" {
  name            = "back-map-http"
  default_service = google_compute_backend_service.back.id
}

resource "google_compute_target_http_proxy" "back" {
  name    = "back-http-lb-proxy"
  url_map = google_compute_url_map.back.id
}

resource "google_compute_global_forwarding_rule" "back" {
  name                  = "back-http-content-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "8080"
  target                = google_compute_target_http_proxy.back.id
  ip_address            = var.global_address.id
}

## front
resource "google_compute_health_check" "front" {
  name               = "front-http-basic-check"
  check_interval_sec = 5
  healthy_threshold  = 2
  http_health_check {
    port               = 80
    port_specification = "USE_FIXED_PORT"
    proxy_header       = "NONE"
    request_path       = "/"
  }
  timeout_sec         = 5
  unhealthy_threshold = 2
}

resource "google_compute_backend_service" "front" {
  name                            = "front-backend-service"
  connection_draining_timeout_sec = 0
  health_checks                   = [google_compute_health_check.front.id]
  load_balancing_scheme           = "EXTERNAL_MANAGED"
  port_name                       = "http-front"
  protocol                        = "HTTP"
  session_affinity                = "NONE"
  timeout_sec                     = 30
  backend {
    group           = var.front_group.instance_group
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

resource "google_compute_url_map" "front" {
  name            = "front-map-http"
  default_service = google_compute_backend_service.front.id
}

resource "google_compute_target_http_proxy" "front" {
  name    = "front-http-lb-proxy"
  url_map = google_compute_url_map.front.id
}

resource "google_compute_global_forwarding_rule" "front" {
  name                  = "front-http-content-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED"
  port_range            = "80"
  target                = google_compute_target_http_proxy.front.id
  ip_address            = var.global_address.id
}
