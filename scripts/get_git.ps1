param(
[string]$repo="https://github.com/emyode/InfraTemplate/archive/master.zip",
[string]$Remoteorigin="https://yoururl/yourproject/_git/reponame", #### critical to automate the upload to your repo 
[string]$email = "youremail@mail.com",                             #### critical to automate the upload to your repo 
[string]$userid=youralias_username"                                #### critical to automate the upload to your repo 
)



cd $PSScriptRoot
$newpath = (join-path -Path PSScriptRoot -ChildPath "Repo")
mkdir $newpath -Force -ErrorAction Ignore

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri $repo -OutFile $newpath\master.zip 
Expand-Archive $newpath\master.zip $newpath -Force


cd $newpath\InfraTemplate-master
git init
git add --all 
git commit -m "Initial commit"

git config --global user.name drjp81
git config --global user.email $email

git remote add origin $Remoteorigin
git pull --all --force
git push --all --force
