name = "utk-test"
#project    = "pocs-370205"
project_id = "pocs-370205"
region     = "us-central1"
#network                 = ["projects/${var.project_id}/global/networks/${var.network_name}"]
node_type               = "REDIS_STANDARD_SMALL"
shard_count             = "3"
replica_count           = "0"
transit_encryption_mode = "TRANSIT_ENCRYPTION_MODE_DISABLED"
authorization_mode      = "AUTH_MODE_DISABLED"

redis_configs = {
  maxmemory-policy = "volatile-ttl"
}

service_connection_policies = {
  test-net-redis-cluster = {
    network_name    = "gcp-vpc"
    network_project = "pocs-370205"
    subnet_names = [
      "bastion-host-subnet",
      "redis-memorystore",
    ]
  }
}
