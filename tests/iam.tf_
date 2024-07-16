resource "google_project_service_identity" "network_connectivity_sa" {
  provider = google-beta

  project = var.project_id
  service = "networkconnectivity.googleapis.com"
}

resource "google_project_iam_member" "network_connectivity_sa" {
  project = var.project_id
  role    = "roles/networkconnectivity.serviceAgent"
  member  = "serviceAccount:${google_project_service_identity.network_connectivity_sa.email}"
}
