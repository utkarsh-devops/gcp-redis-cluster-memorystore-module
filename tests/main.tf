module "redis_cluster" {
  source = "../"
  # version = "~> 9.0"

  name                    = var.name
  project                 = var.project_id
  region                  = var.region
  network                 = ["projects/${var.project_id}/global/networks/${var.network_name}"]
  node_type               = var.node_type
  shard_count             = var.shard_count
  replica_count           = var.replica_count
  transit_encryption_mode = var.transit_encryption_mode
  authorization_mode      = var.authorization_mode

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
    maxmemory-policy = var.maxmemory-policy
  }
}
