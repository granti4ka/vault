# Manage auth methods broadly across Vault
path "auth/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create, update, and delete auth methods
path "sys/auth/*"
{
  capabilities = ["create", "update", "delete", "sudo"]
}

# List auth methods
path "sys/auth"
{
  capabilities = ["read"]
}

# List existing policies
path "sys/policies/acl"
{
  capabilities = ["list"]
}

# Create and manage ACL policies
path "sys/policies/acl/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# List, create, update, and delete key/value secrets
path "+/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}

# Create and manage secret engines broadly across Vault.
path "sys/mounts/*"
{
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}
# Create and manage secret engines broadly across Vault.
path "+/mounts"
{
  capabilities = ["create", "read", "update", "delete", "list"]
}
# List existing secret engines.
path "sys/mounts*"
{
  capabilities = ["read"]
}

# Read health checks
path "sys/health"
{
  capabilities = ["read", "sudo"]
}

# To print out the permitted capabilities of a token on a path.
path "sys/capabilities"
{
  capabilities = ["create", "update"]
}

# To print out the permitted capabilities of a token on a path.
path "sys/capabilities-self"
{
  capabilities = ["create", "update"]
}

#It contains the paths that are used to configure Vault itself as well as perform core operations.
path "sys/*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

