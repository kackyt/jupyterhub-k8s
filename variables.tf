variable "project_id" {
  type = string
}

variable "terraform_service_account" {
  type = string
}

variable "gke_cluster_name" {
  type = string
}

variable "dns_name" {
  type = string
}

variable "auth0_domain" {
  type = string
}

variable "auth0_client_id" {
  type = string
}

variable "auth0_client_secret" {
  type = string
}

variable "admin_users" {
  type = list(string)
}
