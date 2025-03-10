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

resource "snowflake_schema" "my_schema" {
  database = "db_test"
  name     = "main"
  comment  = "Schema principal"
}

resource "snowflake_table" "cliente" {
  database = "db_test"
  schema   = "main"
  name     = "CLIENTE"
  comment  = "Tabela de clientes"

  column {
    name    = "ID"
    type    = "NUMBER(10,0)"
    comment = "Identificador único do cliente"
  }

  column {
    name    = "NOME"
    type    = "STRING"
    comment = "Nome do cliente"
  }

  column {
    name    = "DATA_CADASTRO"
    type    = "TIMESTAMP_NTZ"
    comment = "Data de cadastro do cliente"
  }
}
