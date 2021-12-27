#!/bin/bash
#############################################################################################################################################################
#create !
if [ -d "/images" ]
then
    echo "Directory image exists."

else 
    mkdir images
fi

for num in {1..100} 
    do 
    wget -O images/dog_$num.jpg https://img1.grunge.com/img/gallery/the-real-reason-dogs-tilt-their-heads/intro-1601575707.jpg 
    done 
echo "All images create"

#############################################################################################################################################################
StorageName1= "orelrahumstorage1ubuntu"
ResourceGroup1="orelrahumubuntu_group"
containerName1 = "quickstartblobs3"
accountkey1=`az storage account keys list -g $ResourceGroup1 -n $StorageName1 --query "[0].value"`
SASkey1=`az storage container generate-sas --account-key $accountkey1 --account-name $StorageName1 --expiry 2022-01-01 --name $containerName1 --permissions dlrw`
storage1url="https://${StorageName1}.blob.core.windows.net/${containerName1}?$SASkey1"

write-host $storage1url

#upload to storage1
sudo azcopy copy "images" $storage1url --recursive=true





##############################################################################################################################################################
#get storage2 key
#copy from storage1 to storage2

#sudo azcopy copy  $storage1url $storage2url --recursive=true