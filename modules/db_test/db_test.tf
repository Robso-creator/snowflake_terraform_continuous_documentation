terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.85"
    }
  }
}

resource "snowflake_database" "db_test" {
  name    = "db_test"
  comment = "Banco de dados teste"
}
