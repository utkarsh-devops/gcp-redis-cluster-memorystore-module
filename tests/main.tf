module "redis_cluster" {
  source  = "terraform-google-modules/memorystore/google//modules/redis-cluster"
  version = "~> 9.0"

  name      = "utk-test-redis-cluster"
  project   = var.project_id
  region    = "us-central1"
  network   = ["projects/${var.project_id}/global/networks/${var.network_name}"]
  node_type = "REDIS_STANDARD_SMALL"

  service_connection_policies = {
    test-net-redis-cluster-scp = {
      network_name    = var.network_name
      network_project = var.project_id
      subnet_names = [
        "bastion-host-subnet",
        "redis-memorystore",
      ]
    }
  }

  redis_configs = {
    maxmemory-policy = "volatile-ttl"
  }
}
