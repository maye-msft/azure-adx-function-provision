# Azure Function in Python with Github Continuous Deployment (CD)

This repo is an Azure Function project with python, the [```deploy.sh```](./deploy.sh) is the shell script with Azure CLI to create the Azure Function environment in Azure and config this github repo as code base. 

**So when the code change committed in this repo, it will deploy to Azure Function environment.**

So far only **App Service Plan** supports python/linux CD. the Consumption Plan will raise some errors during provision. 
https://github.com/microsoft/vscode-azurefunctions/issues/923

Before executing the [```deploy.sh```](./deploy.sh), some params need to changed and a service principal is needed. 
