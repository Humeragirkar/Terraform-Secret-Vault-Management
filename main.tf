provider "aws" {
  region = "us-east-1"
}

# Provider: Vault Configuration
provider "vault" {
  address            = "http://18.206.163.84:8200"
  skip_child_token   = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "53970adb-605b-169d-b536-f14cdac7d205"
      secret_id = "d5093476-5d84-980b-a33f-0f699cb93ceb"
    }
  }
}

# Data Source: Read secret from Vault
data "vault_kv_secret_v2" "example" {
  mount = "kv"           # Replace with your actual KV mount path if not "kv"
  name  = "kv_secret"    # Replace with your actual secret path
}

resource "aws_instance" "example" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"

  tags = {
    Secret = data.vault_kv_secret_v2.example.data["username"]  # Ensure "usetname" is a valid key in your Vault secret
  }
}
