variable "project_id" {
  description = "Google cloud project id to create redis cluster."
  type        = string
  default     = "pocs-370205"
}

variable "network_name" {
  description = "GCP Network Name"
  type        = string
  default     = "gcp-vpc"
}
