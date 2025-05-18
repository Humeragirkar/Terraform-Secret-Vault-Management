# Terraform + Vault: Secret Management with EC2

This project demonstrates how to securely retrieve secrets from **HashiCorp Vault** using **Terraform** and use them within **AWS EC2 instance configuration**.

---

## 🔧 What It Does

- Connects to a Vault server using **AppRole authentication**
- Retrieves a secret from a **KV v2 secrets engine**
- Provisions an **EC2 instance on AWS**
- Applies a **tag** to the EC2 instance using the secret value

---
## 1. Initialize Terraform
terraform init

## 2. Apply the configuration
terraform apply

📌 Notes
Make sure Vault is reachable from your Terraform runner.
Ensure role_id and secret_id are valid and not expired.
If using a remote Vault server, consider securing it via HTTPS and enabling authentication mechanisms properly.



