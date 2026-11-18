output "ids_instancias" {
  description = "Ids de las instancias creadas"
  value = aws_instance.mi_instancia_efs_kp1[*].id
}
output "cantidad_instancias" {
    description = "Cantidad de las instancias creadas"
    value = length(aws_instance.mi_instancia_efs_kp1)
}
output "ip_publica_instancias" {
  description = "IPs publicas de la instancia creadas"
    value = aws_instance.mi_instancia_efs_kp1[*].public_ip
}
output "zonas_disponibilidad" {
  description = "Zonas de disponibilidad de las instancias creadas"
    value = aws_instance.mi_instancia_efs_kp1[*].availability_zone
}