## Readme

This repo contains: 

 - A powershell "search and replace script" to handle certain arm template values 
 - A Folder containing basir ARM templates to deploy basic (free) web apps and SQL databases
 - A yml (yaml) template for a basic build profile, to package the latest scripts and ARM Templates to send off to the deployment pipelines

And a "Infra Deploy Pipeline.json" file that contains an export of the release pipeline

This Repo is meant to be used by **Infra/OPS** to autonomously deploy their infrastructure as code in the Azure Cloud infrastructure.

It requires library (**globally** pipelined-shared variables) that define a client name, and a product name

 - ClientID=Client Name 
 - ProductID=Product Name
 - sqladminUsername=The username for the SQL Server Database
Also local (per-environment/stage) definitions of sql Database passwords
i.e.: sqladminPass

It is important not to use spaces in the names, nor underscores (hyphens are okay)

This should include everything required to rapidly set up a deployment pipeline for a new project.