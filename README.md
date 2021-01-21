# Overview of CI/CD Project

This is a repository to store files related to the Udacity Azure Engineer Nanodegree CI/CD Project. This project will deploy a Flask Machine Learning application that will run in Azure App Services.

## Project Plan

[Trello board for this project][1]

[Google Sheets spreadsheet of the original and final project plan][2]

## Instructions

<TODO:  
* Architectural Diagram (Shows how key parts of the system work)>

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

Screenshot showing the cloned GitHub repository in Azure Cloud Shell:
![Alt text](/Cloned_Repo_Azure.png?raw=true "Cloned_Repo_Azure.png")

* Passing tests that are displayed after running the `make all` command from the `Makefile`

Screenshot displaying the passing tests from running `make all` in Azure Cloud Shell:
![Alt text](/Cloud_Shell_Setup_Passing_Tests.png?raw=true "Cloud_Shell_Setup_Passing_Tests.png")

Screenshot demonstrating passing tests during a GitHub Actions build:
![Alt text](/Passing_GitHub_Actions_Build.png?raw=true "Passing_GitHub_Actions_Build.png")

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

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