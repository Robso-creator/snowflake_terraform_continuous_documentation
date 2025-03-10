resource "snowflake_schema" "my_schema" {
  database = "db_test"
  name     = "main"
  comment  = "Schema principal"
}
