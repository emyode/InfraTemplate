## Readme

This repo contains: 

 - A powershell "search and replace script" to handle certain arm template values 
 - A Folder containing basic ARM templates to deploy basic (free) web apps and SQL databases
 - A yml (yaml) template for a basic build profile, to package the latest scripts and ARM Templates to send off to the deployment pipelines

And a "Infra Deploy Pipeline.json" file that contains an export of the release pipeline

This Repo is meant to be used by **Infra/OPS** to autonomously deploy their infrastructure as code in the Azure Cloud infrastructure.

## IMPORTANT
It requires a "library" (**globally** pipelined-shared variables) that define a client name, and a product name that must be linked in the deployment pipeline. And it must contain:
 - ClientID=Client Name 
 - ProductID=Product Name
 - sqladminUsername=The username for the SQL Server Database
Also local (per-environment/stage) definitions of sql Database passwords
i.e.: sqladminPass

It is important not to use spaces in the names, nor underscores (hyphens are okay)

This should include everything required to rapidly set up a deployment pipeline for a new project.

## Instructions

**Usage** 
1. Download the whole repo (as a zip from the clone menu)
2. Create an Azure Devops project
3. Create a "OPS" Repo in your Azure Devops Project
4. Unzip locally to your computer
5. Upload the whole repo to your "OPS" Azure Devops project
6. Go to your Azure Devops Project, and check your Pipelines, there should be a Pipeline/Build named "OPS" or Whatever your repo is named
7. Run it, debug and amend it as needed. (as is , it should work)
8. Create a Variable Group In Library, it mus include the three variables as stated above
9. Adjust the Variables to reflect your product and your clientname
10. Create a new deploy pipeline, a bogus empty with a fake empty stage one (otherwise you cannot import another one)...silly but yeah...
11. In the Deployment pipeline editor, under the little New caret on the left, hit **import**
12. Import the "Infra Deploy Pipeline.json" file you unzipped earlier
13. Go into the Variables Editor
14. Hit the "Link Variable Group" button
15. Import the Library Variable group in step 8
16. Change the artifact/build
17. Edit the pipeline, steps
18. In the Agent job, for the Agent Pool, choose "Azure Pipelines"
19. In Agent Specification choose "vs2017-win2016"
20. in The Azure Deployment:Create Or Update Resource Group action task Connect, create the proper azure subscription for your infrastructure deployment
21. Still in the Azure Deployment:Create Or Update Resource Group action, define or select your resource group (if it doesn't exist, it will be created"
22. Be sure your location is good
23. Adjust, select your ARM templates and parameters, be aware of the region setting is required.
24. Adjust the database passwords in the variables, ensiure they are noted to input them in the **dev** pipeline later.
25. Run the build
26. Run the deployment, and debug as necessary.
27. Run and test the deployment pipeline

# Todo
Add a step to automate the download, the unzip and the reupload of the Github Repo to the Azure Devops GIT

