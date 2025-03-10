# resource "snowflake_view" "my_view" {
#   database    = "db_test"
#   schema      = "main"
#   name        = "VW_CLIENTE_ATIVO"
#   statement   = "SELECT ID, NOME FROM MEU_CLIENTE WHERE STATUS = 'ATIVO'"
#   is_secure   = false
# }
