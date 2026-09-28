terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 1.5.0"

}

provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "minecraft" {
  name        = "minecraft-server-sg"
  description = "Security group for Minecraft server"

  # SSH access
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_IP_ADDRESS"]
  }

  # Minecraft Java Edition
  ingress {
    description = "Minecraft"
    from_port   = 25565
    to_port     = 25565
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "minecraft" {
  ami           = "ami-0231a154479eac2ae"
  instance_type = "t3.small"
  key_name = "for-docker"

  security_groups = [aws_security_group.minecraft.name]

  user_data = templatefile("${path.module}/../scripts/setup.sh", {
  docker_compose = file("${path.module}/../docker/docker-compose.yml")
  })

  tags = {
    Name = "minecraft-server"
  }
}