# Azure DevOps Project 

![example image](https://cdn.sanity.io/images/l7p1u5mb/production/655cdf311a4eedc8d0f2919b7f0c054dcb154a9d-379x110.svg?q=75&fit=max&auto=format)


# The logic in my Pipeline
pipeline trigger : change on my_app.py in main branch

pipeline process:
1. Setting up 2 storage servers by ARM TEMPLATE file
2. Setting up windows server by ARM TEMPLATE file
3. get windows server ip (from Section 2)
4. login by SSH 
5. download create_upload_copy.ps1 from this reposity to windows server
6. Run script that will create, upload 100 blobs to A and B (Create already in section 1) on windows server


# configurations deetails :
Resource group : orelrahumubuntu_group

Storage names : orelrahumstorage1ubuntu , orelrahumstorage2ubuntu 

 containerName = "quickstartblobs3"

Server Name : orelrahumserverubuntu

 user: orelrahum
 
 pass: **********

