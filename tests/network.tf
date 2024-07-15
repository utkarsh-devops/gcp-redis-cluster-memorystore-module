locals {
  network_name = "test-net-redis-cluster"
}

module "test_vpc" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 9.0"
  project_id   = var.project_id
  network_name = local.network_name
  mtu          = 1460

  subnets = [
    {
      subnet_name   = "subnet-100"
      subnet_ip     = "10.10.100.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "subnet-101"
      subnet_ip     = "10.10.101.0/24"
      subnet_region = "us-central1"
    },
    {
      subnet_name   = "subnet-102"
      subnet_ip     = "10.10.102.0/24"
      subnet_region = "us-east1"
    },
  ]
}
