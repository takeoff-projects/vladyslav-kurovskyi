
// Settings for the google cloud account
// Write the path to the json key giving access to the project
provider "google" {
  credentials = file("service-account-file.json")
  project = "roi-takeoff-user79"
  region  = "europe-central2"
  zone    = "europe-central2"
}

// Resource 1: cloud run service running the docker image
// Write the path to the docker image hosted in the google container registry
// To set up this resource with Terraform, the service account key used
// must have the appropriate permissions.
resource "google_cloud_run_service" "default" {
  name     = "applied-skills-project"
  location = "europe-central2"

  template {
    spec {
      containers {
        image = "gcr.io/roi-takeoff-user79/app"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}