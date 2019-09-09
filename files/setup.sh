## INIT VAULT
echo -e "\n[*] Init vault..."
vault operator init > /root/.key.txt

## UNSEAL VAULT
echo -e "\n[*] Unseal vault..."
vault operator unseal $(grep 'Key 1:' /root/.key.txt | awk '{print $NF}')
vault operator unseal $(grep 'Key 2:' /root/.key.txt | awk '{print $NF}')
vault operator unseal $(grep 'Key 3:' /root/.key.txt | awk '{print $NF}')

## AUTH
echo -e "\n[*] Auth..."
vault login $(grep 'Initial Root Token:' /root/.key.txt | awk '{print $NF}')
vault audit enable file file_path=/var/log/vault_audit.log

## CREATE USER
echo -e "\n[*] Create user..."
vault auth enable -description="Enabled for an Auth USERPASS Method" userpass
#vault policy-write -address=${VAULT_ADDR} admin ./config/admin.hcl
vault write auth/userpass/users/admin password=admin policies=admin

## ENABLE new Secrets Engine
echo -e "\n[*] Enable secrets engine..."
vault secrets enable -path=secret -description="Secrets for services" kv
vault secrets enable -path=keys -description="Infrastructure SSH-keys" kv
vault secrets enable -path=passwords -description="Infrastructure passwords for services" kv

vault kv put keys/users/Grant key=rsa-grant
vault kv put keys/dev/dev1 key=rsa-dev1
vault kv put keys/prod/serv1 key=rsa-serv1

vault kv put passwords/OpenVas user=admin pass="passw0rd1"
vault kv put passwords/Kanban user=admin@mail.ru pass="passw0rd1"

vault write secret/mysql/prod/database url=mysql login=mysql-root password=12345
vault write secret/mongo/prod/database url=mongo login=mongo-root password=12345

## CREATE BACKUP TOKEN
echo "[*] Create backup token..."
vault token create -display-name="backup_token" >> /home/vault/backup_token.txt
