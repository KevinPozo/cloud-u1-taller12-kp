variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "Id de la AMI"
  type        = string
  default     = "ami-0c230065b91270bc6"
}

variable "tipo_instancia" {
  description = "Tipo de Instancia"
  type        = string
  default     = "t2.micro"
}

variable "nombre_llave" {
  description = "Nombre del par de llaves"
  type        = string
  default     = "mi-primera-llaves-kp"
}

variable "cantidad_instancias" {
  description = "Cantidad de instancias"
  type        = number
  default     = 2
}