# Azure PoC Infrastructure Deployment with Bicep

This repository contains a fully modular Infrastructure-as-Code (IaC) setup using **Azure Bicep** for deploying a Proof of Concept (PoC) environment in Azure. It includes everything needed for Entra Verified ID and monitoring.

## 📦 Modules Included

The Bicep modules are stored in the `infra/` directory and include:

- `loganalyticworkspace.bicep` – Azure Monitor Log Analytics
- `applicationinsights.bicep` – App Insights with workspace integration
- `keyvault.bicep` – Secure secrets management
- `storageaccount.bicep` – Storage Account for configuration files
- `blobservice.bicep` – Blob service settings (retention/CORS)
- `staticwebsite.bicep` – Static web hosting settings (via blob)
- `appserviceplan.bicep` – Free tier App Service plan
- `appservice.bicep` – Azure Web App with App Insights linked
- `managedidentity.bicep` – User-assigned Managed Identity
- `grafana.bicep` – Azure Managed Grafana instance

## 🚀 Deploy via GitHub Actions

This repo includes a ready-to-use workflow in `.github/workflows/deploy-infra.yml`.

### Required Secrets:

- `AZURE_CREDENTIALS`: Output of `az ad sp create-for-rbac --sdk-auth`
- `AZURE_RG`: Your target Azure Resource Group name

### Trigger the deployment:

You can run the deployment manually from the **Actions** tab in GitHub.

## ⚙️ Parameters

The deployment uses a `parameters.json` file to pass in:

```json
{
  "parameters": {
    "location": {
      "value": "westeurope"
    },
    "projectPrefix": {
      "value": "verifiedid"
    }
  }
}