output "minecraft_public_ip" {
  description = "Public IP address of the Minecraft EC2 instance"
  value       = aws_instance.minecraft.public_ip
}