#!/bin/bash
IP=$(az network public-ip show -g orelrahum -n orelrahumserver-ip --query "ipAddress" | tr -d '\t\r\n')
IP=${IP:1}
IP=${IP::-3}
sshpass -p 'Test12345678' ssh -o "StrictHostKeyChecking no" orelrahum@${IP//[$'\t\r\n ']} 'echo wget "https://dev.azure.com/Orelrahum8/fb5604e4-5a67-475b-909a-cb7bee6ca465/_apis/git/repositories/693ac3f3-900a-4659-bd76-8f97075a52d8/items?path=/Create_upload_copy/create_upload_copy_maker.ps1&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=main&resolveLfs=true&%24format=octetStream&api-version=5.0&download=true" -OutFile "create_upload_copy.ps1" >link.ps1;'
sshpass -p 'Test12345678' ssh -o "StrictHostKeyChecking no" orelrahum@${IP//[$'\t\r\n ']} 'powershell "C:\Users\orelrahum\link.ps1";'
sshpass -p 'Test12345678' ssh -o "StrictHostKeyChecking no" orelrahum@${IP//[$'\t\r\n ']} 'powershell "C:\Users\orelrahum\create_upload_copy.ps1";'