# Azure Synapse SQL Pool Restore Automation

Problem Statement: Currently Azure Synapse workspace does not have long term back up. One of the recommended work-around is that, restore Azure synapse SQL Pool back up and keep it in paused state. It will cost only for the storage until and unless your sql pool is in online state.

Automation script Pre-requisites:
1. You need to have subscription access (to deploy the resources)
2. You need to have access to synapse analytics workpace

You can run this module in Azure DevOps, Azure Powershell etc.
Incase you are running in Azure DevOps, you need to have authorized subscription from the Azure DevOps.
