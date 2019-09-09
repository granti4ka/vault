echo -e "\n\n[*] Unseal vault... $(date)"
echo -e "[*] Step 1"
vault operator unseal $(grep 'Key 1:' /root/.key.txt | awk '{print $NF}')
echo -e "\n[*] Step 2"
vault operator unseal $(grep 'Key 2:' /root/.key.txt | awk '{print $NF}')
echo -e "\n[*] Step 3"
vault operator unseal $(grep 'Key 3:' /root/.key.txt | awk '{print $NF}')
