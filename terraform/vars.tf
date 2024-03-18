variable "location" {
  type        = string
  description = "Region de Azure donde crearemos la infraestructura"
  default     = "East US"
}

variable "vm_size" {
  type        = string
  description = "Tamaño de la máquina virtual"
  default     = "Standard_D1_v2" # 3.5 GB, 1 CPU
}
