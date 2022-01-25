variable "environment" {
  default = "dev"
}


variable "location" {
  default = "West Europe"
  description   = "Location of the resource group."
}


variable "VM_NAME" {
  default = "TestVM"
}

variable "VM_ADMIN" {
  default = "azure-admin"
}

variable "DEFAULT_SSHKEY" {
  default = "yourpublicsshkey"
}