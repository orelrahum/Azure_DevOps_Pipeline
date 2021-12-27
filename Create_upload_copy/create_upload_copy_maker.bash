#!/bin/bash
################################################################################################################################
#need install on clean ubuntu server
#Download AzCopy
#wget https://aka.ms/downloadazcopy-v10-linux

#Expand Archive
#tar -xvf downloadazcopy-v10-linux

#Move AzCopy to the destination you want to store it
#sudo cp ./azcopy_linux_amd64_*/azcopy /usr/bin/

#login to azcopy
#sudo azcopy login --tenant-id "72f988bf-86f1-41af-91ab-2d7cd011db47"

######################################################################################
#login az 
#az login --tenant 72f988bf-86f1-41af-91ab-2d7cd011db47


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

accountkey1=`az storage account keys list -g orelrahumubuntu_group -n orelrahumstorage1ubuntu --query "[0].value"`
echo $accountkey1
SASkey1=`az storage container generate-sas --account-key $accountkey1 --account-name orelrahumstorage1ubuntu --expiry 2022-01-01 --name quickstartblobs3 --permissions dlrw`
echo $SASkey1
storage1url="https://orelrahumstorage1ubuntu.blob.core.windows.net/quickstartblobs3?${SASkey1:1:-1}"
echo $storage1url


#upload to storage1
sudo azcopy cp "images" $storage1url --recursive=true





##############################################################################################################################################################
#get storage2 key
#copy from storage1 to storage2
accountkey2=`az storage account keys list -g orelrahumubuntu_group -n orelrahumstorage2ubuntu --query "[0].value"`
echo $accountkey2
SASkey2=`az storage container generate-sas --account-key $accountkey2 --account-name orelrahumstorage2ubuntu --expiry 2022-01-01 --name quickstartblobs3 --permissions dlrw`
echo $SASkey2
storage2url="https://orelrahumstorage2ubuntu.blob.core.windows.net/quickstartblobs3?${SASkey2:1:-1}"
echo $storage2url


sudo azcopy cp  $storage1url $storage2url --recursive=true