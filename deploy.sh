username=''
password='xxx'
tenant=''

resgrp='adxdemo200507'
location='southeastasia'

storage='storageaccount200507'
storagesku='Standard_LRS'

appplan='mayemsft-appplan-200507'
appplansku='B1'

func='mayemsft-funcapp-200507'

giturl='https://github.com/maye-msft/azure-adx-function-provision'
gitbranch='master'
gittoken='xxx'
gitprovider='github'


az login --service-principal    \
 --username=$username     \
 --password=$password     \
 --tenant=$tenant



az group create \
  --name $resgrp \
  --location $location


az storage account create \
  --name $storage \
  --location $location \
  --resource-group $resgrp \
  --sku Standard_LRS


az appservice plan create -g $resgrp -n $appplan \
    --is-linux --sku $appplansku

az functionapp create \
  --name $func \
  --storage-account $storage \
  --resource-group $resgrp \
  --functions-version 3 \
  --os-type Linux \
  --runtime python \
  --runtime-version 3.7 \
  --plan $appplan

sleep 2m

az functionapp deployment source config \
    --repo-url $giturl \
    --branch $gitbranch \
    --git-token $gittoken \
    --resource-group $resgrp \
    --name $func \
    --repository-type $gitprovider



