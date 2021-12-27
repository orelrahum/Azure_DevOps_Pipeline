#!/bin/bash
IP=$(az network public-ip show -g orelrahum -n orelrahumserverubuntu-ip --query "ipAddress" | tr -d '\t\r\n')
IP=${IP:1}
IP=${IP::-3}
sshpass -p 'Test12345678' ssh -o "StrictHostKeyChecking no" orelrahum@${IP//[$'\t\r\n ']} 'mkdir 1;'
sshpass -p 'Test12345678' ssh -o "StrictHostKeyChecking no" orelrahum@${IP//[$'\t\r\n ']} 'mkdir 2;'
sshpass -p 'Test12345678' ssh -o "StrictHostKeyChecking no" orelrahum@${IP//[$'\t\r\n ']} 'mkdir 3;'