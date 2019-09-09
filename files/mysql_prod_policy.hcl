#path "secret/mysql/prod/database*" {
#  capabilities = ["create", "read", "update", "delete", "list"]
#}

#full path secret/mysql/prod/database
path "secret/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
path "secret/mongo*" {
  capabilities = ["list"]
}
path "sys/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}
