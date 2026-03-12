variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Folder ID"
}

variable "zone" {
  type        = string
  description = "YC zone"
  default     = "ru-central1-a"
}

variable "ssh_user" {
  type        = string
  description = "SSH user name"
  default     = "ubuntu"
}

variable "public_key_path" {
  type        = string
  description = "Path to public SSH key"
}