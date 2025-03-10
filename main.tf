terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.85"
    }
  }
}

variable "organization_name" {
  type        = string
  description = "Nome da organização no Snowflake"
}

variable "account_name" {
  type        = string
  description = "Nome da conta no Snowflake"
}

variable "user" {
  type        = string
  description = "Usuário para autenticação"
}

variable "password" {
  type        = string
  description = "Senha para autenticação"
}

provider "snowflake" {
  organization_name = var.organization_name
  account_name      = var.account_name
  user              = var.user
  password          = var.password
  warehouse         = "COMPUTE_WH"
}

module "db_test" {
    source = "./modules/db_test"

    providers = {
        snowflake = snowflake
    }
}
