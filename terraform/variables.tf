# provider & location

variable "project_id"{
    type = string
}

variable "region"{
  type = string
  default = "us-central1"
  description = "Region for the infra"
}

# GKE
variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "gke_location" {
  default     = "us-central1-a"
  description = "gke cluster location"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}

variable "gke_node_location" {
  type        = list(string)
  description = "Disk size for the node"
  default     = [ "us-central1-a" ]
}

variable "gke_node_type" {
    type    = string
    description = "Compute Type for the node"
    default = "e2-micro"
}

variable "gke_node_disk" {
    type    = number
    description = "Disk size for the node"
    default = 30
}
