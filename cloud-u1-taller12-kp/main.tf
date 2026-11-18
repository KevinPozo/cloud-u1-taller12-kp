# Configuracion del proveedor de AWS
provider "aws" {
  region = var.region
}

# 1. Security Group para las instancias EC2 (Puerto 22 - SSH)
resource "aws_security_group" "mi-sg-efs-instancias" {
  name        = "mi-security-group-terraform-kp-efs-instancias"
  description = "Security group para conexion SSH a las instancias"
  vpc_id      = "vpc-0478126e7e1a4196b"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  egress {
    description = "Permitir a todos el trafico"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 2. Security Group para EFS / NFS (Puerto 2049)
resource "aws_security_group" "mi-sg-efs" {
  name        = "mi-security-group-terraform-kp-efs"
  description = "Security group para el trafico NFS de EFS"
  vpc_id      = "vpc-0478126e7e1a4196b"

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Declaración de la instancia EC2 (puedes asignarle ambos SGs si tu profesor lo pide)
resource "aws_instance" "mi_instancia_efs_kp1" {
  count                  = var.cantidad_instancias
  ami                    = var.ami_id
  instance_type          = var.tipo_instancia
  key_name               = var.nombre_llave
  vpc_security_group_ids = [
    aws_security_group.mi-sg-efs-instancias.id,
    aws_security_group.mi-sg-efs.id
  ]
  
  tags = {
    Name = "mi-instancia-efs-${count.index+1}-kp"
  }
}