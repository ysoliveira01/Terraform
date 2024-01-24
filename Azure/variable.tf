variable "nome_cluster" {
  description = "nome do cluster"
  default     = "lab-aks"
}

variable "Squad" {
  description = "squad responsável pelo projeto."
  #default     = ""
}

variable "CR" {
  description = "número do CR."
  #default     = ""
}

variable "region" {
  description = "região selecionada"
  default     = "eastus"
}

variable "descrição" {
  description = "Descrição"
  default     = "Cluster no azure para teste"
}

variable "environment" {
  default = "production"
}

variable "nodepools" {
  default = "linux"
}

variable "vm_size" {
  default = "Standard_D2_v2"
}

variable "min_count" {
  default = "1"
}

variable "max_count" {
  default = "3"
}

variable "mode" {
  default = "User"
}

variable "os_disk_size_gb" {
  default = "30"
}

variable "os_type" {
  default = "Linux"
}

variable "priority" {
  default = "Regular"
}

variable "gateway_subnet" {
  default = ""
}