# Policy as Code (Terraform)

This repository defined library for terraform OPA policies. There are maintly two policies defined in this library.
In case any one of the following OPA policy violation occurs in terraform plan, it will stop the deployment and displays violation message in the GitHub Action summary.

## Google Cloud Resources Not Allowed

- In this policy three resources defined as allowed resources.
  - Cloud Run
  - Cloud Run IAM Policy
  - Cloud Spanner Database
- All other resources are defined as per this policy.

## Google Cloud Resources Mandatory Labels

- In this policy five labels defined as mandatory labels for Cloud Run resource.
  - environment
  - app_name
  - app_type
  - iRisk_id
  - cost_center
- If any of these mandatory labels removed from the terraform code, it will violates the policy.
