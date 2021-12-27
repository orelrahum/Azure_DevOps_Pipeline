#!/bin/bash
IP=$(az network public-ip show -g orelrahumubuntu_group -n orelrahumserverubuntu-ip --query "ipAddress" | tr -d '\t\r\n')
IP=${IP:1}
IP=${IP::-3}
sshpass -p 'Test12345678' ssh -o "StrictHostKeyChecking no" orelrahum@${IP//[$'\t\r\n ']} 'wget -O create_upload_copy_maker.bash https://dev.azure.com/Orelrahum8/fb5604e4-5a67-475b-909a-cb7bee6ca465/_apis/git/repositories/76f0dc8c-443f-43c0-92c0-b9a34267dee5/items?path=/Create_upload_copy/create_upload_copy_maker.bash&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=main&resolveLfs=true&%24format=octetStream&api-version=5.0&download=true'
sshpass -p 'Test12345678' ssh -o "StrictHostKeyChecking no" orelrahum@${IP//[$'\t\r\n ']} 'bash create_upload_copy_maker.bash ;'