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
$StorageName1= "orelrahumstorage1"
$ResourceGroup1="orelrahum"
$storageAcc1=Get-AzStorageAccount -ResourceGroupName $ResourceGroup1 -Name $StorageName1
$ctx1 = $storageAcc1.Context
$containerName1 = "quickstartblobs3"
$accountkey1=az storage account keys list -g $ResourceGroup1 -n $StorageName1 --query "[0].value"
$SASkey1=az storage container generate-sas --account-key $accountkey1 --account-name $StorageName1 --expiry 2022-01-01 --name $containerName1 --permissions dlrw
$storage1url="https://orelrahumstorage1.blob.core.windows.net/quickstartblobs3?$SASkey1"

write-host $storage1url

#upload to storage1
azcopy copy "images" $storage1url --recursive=true





##############################################################################################################################################################
#get storage2 key
$StorageName2= "orelrahumstorage2"
$ResourceGroup2="orelrahum"
$storageAcc2=Get-AzStorageAccount -ResourceGroupName $ResourceGroup2 -Name $StorageName2
$ctx2 = $storageAcc2.Context
$containerName2 = "quickstartblobs3"


$accountkey2=az storage account keys list -g $ResourceGroup2 -n $StorageName2 --query "[0].value"
$SASkey2=az storage container generate-sas --account-key $accountkey2 --account-name $StorageName2 --expiry 2022-01-01 --name $containerName2 --permissions dlrw
$storage2url="https://orelrahumstorage2.blob.core.windows.net/quickstartblobs3?$SASkey2"

write-host $storage2url

azcopy copy  $storage1url $storage2url --recursive=true