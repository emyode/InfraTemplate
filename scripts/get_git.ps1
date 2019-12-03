param([string]$repo="https://github.com/emyode/InfraTemplate.git")
Install-Module posh-git -Scope CurrentUser -Force

Install-Module posh-git -Scope CurrentUser #-AllowPrerelease -Force # Newer beta version with PowerShell Core support

Import-Module posh-git
cd $PSScriptRoot
$newpath = (join-path -Path PSScriptRoot -ChildPath "Repo")
mkdir $newpath -Force -ErrorAction Ignore
cd $newpath
try {
$result = invoke-expression "git clone $repo -q --progress"
}
catch
{
    Write-Output $_.Exception.Message

}
$result






