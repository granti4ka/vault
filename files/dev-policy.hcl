# Enable key/value secret engine at the keys/ path
path "sys/mounts/keys" {
  capabilities = ["update"]
}

# To list the available secret engines
path "sys/mounts" {
  capabilities = ["read"]
}

# Write and manage secrets in key/value secret engine
path "keys/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create policies to permit apps to read secrets
path "sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

# Create tokens for verification & test
path "auth/token/create" {
  capabilities = ["create", "update", "sudo"]
}
