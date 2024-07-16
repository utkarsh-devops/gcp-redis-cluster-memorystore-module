variable "name" {
  description = "Name of the Redis cluster."
  type        = string
  default     = "utk-test"
}
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
variable "region" {
  description = "GCP Region for the Redis Cluster"
  type        = string
  default     = "us-central1"
}
variable "maxmemory-policy" {
  description = "maxmemory-policy for the Redis Cluster"
  type        = string
  default     = "volatile-ttl"
}

variable "shard_count" {
  description = "Required. Number of shards for the Redis cluster. The minimum number of shards in a Memorystore cluster is 3 shards"
  type        = number
  default     = 3
}

variable "replica_count" {
  description = "The number of replica nodes per shard. Each shard can have 0, 1, or 2 replica nodes. Replicas provide high availability and additional read throughput, and are evenly distributed across zones"
  type        = number
  default     = 0
}
variable "transit_encryption_mode" {
  description = "The in-transit encryption for the Redis cluster. If not provided, encryption is disabled for the cluster. Default value is TRANSIT_ENCRYPTION_MODE_DISABLED. Possible values are: TRANSIT_ENCRYPTION_MODE_UNSPECIFIED, TRANSIT_ENCRYPTION_MODE_DISABLED, TRANSIT_ENCRYPTION_MODE_SERVER_AUTHENTICATION"
  type        = string
  default     = "TRANSIT_ENCRYPTION_MODE_DISABLED"
}

variable "authorization_mode" {
  description = "The authorization mode of the Redis cluster. If not provided, auth feature is disabled for the cluster. Default value is AUTH_MODE_DISABLED. Possible values are: AUTH_MODE_UNSPECIFIED, AUTH_MODE_IAM_AUTH, AUTH_MODE_DISABLED"
  type        = string
  default     = "AUTH_MODE_DISABLED"
}

variable "node_type" {
  description = "The nodeType for the Redis cluster. If not provided, REDIS_HIGHMEM_MEDIUM will be used as default Possible values are: REDIS_SHARED_CORE_NANO, REDIS_HIGHMEM_MEDIUM, REDIS_HIGHMEM_XLARGE, REDIS_STANDARD_SMALL."
  type        = string
  default     = null
}
variable "redis_configs" {
  description = "Configure Redis Cluster behavior using a subset of native Redis configuration parameters"
  type = object({
    maxmemory-clients       = optional(string)
    maxmemory               = optional(string)
    maxmemory-policy        = optional(string)
    notify-keyspace-events  = optional(string)
    slowlog-log-slower-than = optional(number)
    maxclients              = optional(number)
  })
  default = null
}

variable "service_connection_policies" {
  description = "The Service Connection Policies to create"
  type = map(object({
    description     = optional(string)
    network_name    = string
    network_project = string
    subnet_names    = list(string)
    limit           = optional(number)
    labels          = optional(map(string), {})
  }))
  default = {}
}
