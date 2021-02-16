![Python application test with Github Actions](https://github.com/troywill1/CICDProject/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)

# Overview of CI/CD Project

This is a repository to store files related to the Udacity Azure Engineer Nanodegree Continuous Integration/Continuous Deployment (CI/CD) Project. This project will deploy a Flask Machine Learning application that will run in Azure App Services.

## Project Plan

[Trello board for this project.][1]

[Google Sheets spreadsheet of the original and final project plan.][2]

## Instructions

The diagrams below describe, at a high level, *Contiuous Integration* (CI) and *Continuous Deployment* (CD) and the relationships between components.

![Alt text](/CI_Azure_Diagram.png?raw=true "CI_Azure_Diagram.png")

![Alt text](/CD_Azure_Diagram.png?raw=true "CD_Azure_Diagram.png")

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:>

1. Fork this repository to a personal GitHub account. Reference the official [GtiHub documentation][3] for instructions on forking a repository.

<TODO: Steps to configure GitHub Actions and show passing tests>

## Continuous Integration (CI)

2. Configure the build server. For this, we will use GitHub Actions. In the repository that was just forked on GitHub, click *Actions* and then *Skip this and set up a workflow yourself*.

![Alt text](/GitHub_Actions.png?raw=true "GitHub_Actions.png")

3. On the resulting screen, replace the basic workflow code with the code block below and commit the file to the repository.

![Alt text](/Replace_YAML_Code.png?raw=true "Replace_YAML_Code.png")

Replace with this code:

```bash

name: Python application test with Github Actions

on: [push]

jobs:
  build:

	runs-on: ubuntu-latest

	steps:
	- uses: actions/checkout@v2
	- name: Set up Python 3.5
	  uses: actions/setup-python@v1
	  with:
		python-version: 3.5
	- name: Install dependencies
	  run: |
		make install
	- name: Lint with pylint
	  run: |
		make lint
	- name: Test with pytest
	  run: |
		make test
```

Then commit the file `main.yml`.

![Alt text](/Commit_YAML.png?raw=true "Commit_YAML.png")

Now, whenever a change is made to the repository, the build server, GitHub Actions, will run the workflow in `main.yml`. This is *Continuous Integration* or *CI*.

![Alt text](/Actions_Results_1.png?raw=true "Actions_Results_1.png")

![Alt text](/Actions_Results_2.png?raw=true "Actions_Results_2.png")

Hopefully, resulting in passing tests and a successful workflow.

![Alt text](/Passing_GitHub_Actions_Build.png?raw=true "Passing_GitHub_Actions_Build.png")

4. Add a status badge to the `README.md` file in the repository to quickly identify passing tests.

![Alt text](/Create_Badge.png?raw=true "Create_Badge.png")

Copy the Markdown code and add it to the `README.md` file.

![Alt text](/Copy_Markdown.png?raw=true "Copy_Markdown.png")

There will now be a badge in `README.md` displaying the current *Continuous Integration* status.

![Python application test with Github Actions](https://github.com/troywill1/CICDProject/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)

## Continuous Delivery (CD)

<TODO: Steps to configure GitHub for Azure Pipelines>

5. Make sure that the *Azure Pipelines* application is installed and enabled on GitHub. The screenshot below shows that *Azure Pipelines* is installed and integrated with the cloned repository. For instructions on installing applications from the GitHub Marketplace, see the official [GitHub documentation][5]. Search for "Azure Pipelines", install using the "free" billing option and enable for all repositories.

![Alt text](/GitHub_Apps.png?raw=true "GitHub_Apps.png")

<TODO: Steps to clone a repo in Azure Cloud Shell>

6. From the [Azure Portal][4] launch a Bash Azure Cloud Shell.

![Alt text](/Launch_Shell.png?raw=true "Launch_Shell.png")

![Alt text](/Bash_Shell.png?raw=true "Bash_Shell.png")

7. Setup a virtual environment with Python's `virtualenv` tool (VENV) and activate the environment.

```bash
python3 -m venv ~/repos/VENV
source ~/repos/VENV/bin/activate
```

8. Obtain the GitHub Repository location.

![Alt text](/Clone_SSH.png?raw=true "Clone_SSH.png")

9. Create a directory, using the `mkdir` command, to house your cloned repository.

```bash
(VENV) troy@Azure:~/repos$ mkdir CICDProject
```

10. Clone the repository that was forked in Step #1. The command to run from the Bash shell will be similar to the following. Replace the GitHub repository name as needed.

```bash
git clone git@github.com:troywill1/CICDProject.git
```

After running the above clone command in Azure Cloud Shell, the output should be similar to this:
![Alt text](/Cloned_Repo_Azure.png?raw=true "Cloned_Repo_Azure.png")

11. Run the command `make install` from Azure Cloud Shell.

![Alt text](/Make_Install_1.png?raw=true "Make_Install_1.png")
![Alt text](/Make_Install_2.png?raw=true "Make_Install_2.png")

<TODO: Steps to create an Azure App service>

12. Create an App Service and initially deploy the app in Azure Cloud Shell. This step can also be accomplished in the Azure Portal. Be sure to make the name of the App Service unique.

```bash
az webapp up --sku F1 -n flask-ml-service-troy
```

13. Verify that the application works by navigating to the deployed URL.

Browse to `https://<your-appservice>.azurewebsites.net/` and you should see output similar to the screenshot below.

![Alt text](/Sklearn_Home.png?raw=true "Sklearn_Home.png")

This is a view of the service running in Azure App Services from the [Azure Portal][4].

![Alt text](/Azure_App_Services.png?raw=true "Azure_App_Services.png")

<TODO: Steps to run make all from Azure Clouc Shell>

14. From Azure Cloud Shell, run the `make all` command from the `Makefile`:

```bash
(VENV) troy@Azure:~/flask-ml-azure-troy$ make all
```

Output of the passing tests from running the `make all` command in Azure Cloud Shell should be similar to the following:
![Alt text](/Cloud_Shell_Setup_Passing_Tests.png?raw=true "Cloud_Shell_Setup_Passing_Tests.png")

15. In the file `make_predict_azure_app.sh`, change the following line to match the URL of the deployed Azure App Service:

```bash
-X POST https://flask-ml-service-troy.azurewebsites.net:$PORT/predict
```

16. Now, initiate a test run by executing the script that was just edited, `make_predict_azure.sh`. A successful test run should be similar to this:

![Alt text](/Make_Predict.png?raw=true "Make_Predict.png")

<TODO: Steps to configure a project in Azure Pipelines>

17. Next, create an [Azure DevOps Project][6] and give it a name. Note: Some screenshots will look slightly different as some of these steps have already been completed for the base project/repository.

![Alt text](/DevOps_Create_Project.png?raw=true "DevOps_Create_Project.png")

18. Within the newly created project, under `Project Settings`, create a new service connection via the Azure Resource Manager.

![Alt text](/DevOps_Service_Connection.png?raw=true "DevOps_Service_Connection.png")

![Alt text](/DevOps_Service_Principal.png?raw=true "DevOps_Service_Principal.png")

![Alt text](/DevOps_New_Connect.png?raw=true "DevOps_New_Connect.png")

19. Create a Pipeline from within the Azure DevOps Project.

![Alt text](/DevOps_Create_Pipeline.png?raw=true "DevOps_Create_Pipeline.png")

20. Create the GitHub integration from within the Pipeline.

![Alt text](/DevOps_GitHub.png?raw=true "DevOps_GitHub.png")

21. Select the correct GitHub Repository.

![Alt text](/DevOps_Repo.png?raw=true "DevOps_Repo.png")

22. Select `Python to Linux Web App on Azure` and choose the correct Azure Subscription and Web App Name in the subsequent dialog boxes.

![Alt text](/DevOps_App_Name.png?raw=true "DevOps_App_Name.png")

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

<TODO: Steps to show an automatic deployment from Azure Pipelines>

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

>

## Enhancements

<TODO: A short description of how to improve the project in the future>

## Demo 

<TODO: Add link Screencast on YouTube>

[1]: https://trello.com/b/GWL8MO8g/building-ci-cd-pipeline
[2]: https://docs.google.com/spreadsheets/d/1QMoPynXT3BXGuPUoEhMU0OHgs3Zs2ru5FsCxnYTjpDw/edit?usp=sharing
[3]: https://docs.github.com/en/github/getting-started-with-github/fork-a-repo
[4]: https://portal.azure.com
[5]: https://docs.github.com/en/github/customizing-your-github-workflow/installing-an-app-in-your-organization
[6]: https://dev.azure.com/