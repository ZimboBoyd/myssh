#!/bin/sh

mkdir -p ssh

ssh-keygen -t rsa -b 2048 -f ssh/id_rsa -N "" -C "Remote"
ssh-keygen -t rsa -b 2048 -f ssh/id_rsa_rev -N "" -C "Server"

echo -n 'command="/client.sh $SSH_ORIGINAL_COMMAND",no-x11-forwarding,no-agent-forwarding ' > ssh/authorized_keys

cat ssh/id_rsa.pub >>ssh/authorized_keys

