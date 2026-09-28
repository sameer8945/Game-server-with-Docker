# Minecraft Docker Server

A DevOps project that deploys a persistent Minecraft server on AWS EC2 using Terraform and Docker. Terraform provisions the AWS infrastructure, while Docker Compose runs the Minecraft server with persistent world data.



## Setup

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/minecraft-docker-server-project.git
cd minecraft-docker-server-project
```

### 2. Configure your SSH IP address

Open `terraform/main.tf` and replace:

```hcl
cidr_blocks = ["YOUR-IP-ADDRESS/32"]
```

with your public IP address.

### 3. Create `terraform.tfvars`

Create `terraform/terraform.tfvars` and add:

```hcl
aws_region = "ap-south-1"
```

### 4. Initialize Terraform

```bash
cd terraform
terraform init
```

### 5. Review the infrastructure

```bash
terraform plan
```

### 6. Deploy the infrastructure

```bash
terraform apply
```

### 7. Get the server IP

```bash
terraform output
```

Copy the EC2 public IP address from the output.

### 8. Connect to the EC2 instance

Connect to the EC2 instance using SSH or EC2 Instance Connect.

```bash
cd /opt/minecraft
```

### 9. Start the Minecraft server

```bash
sudo docker compose up -d
```

### 10. Verify the Minecraft server

```bash
sudo docker ps
```

Make sure the `minecraft-server` container is running.

### 11. Connect to the Minecraft server

1. Open Minecraft Java Edition.
2. Go to `Multiplayer`.
3. Select `Add Server`.
4. Enter the EC2 public IP address in the `Server Address` field.
5. Connect to the server.

## Destroy the AWS Infrastructure

When you are finished with the project:

```bash
cd terraform
terraform destroy
```