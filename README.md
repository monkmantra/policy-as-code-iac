# Policy as Code (Open Policy Agent)

This repository defines a set of OPA policies to enforce enterprise standards during cloud resource provisioning. In case of any OPA policy violation occurs in Terraform plan, it will stop the deployment and displays violation message in GitHub Actions summary.

## Currently available OPA policies

## Allowed Google Cloud resources

- This policy allows the provisioning of only the below resources:
  - Cloud Run
  - Cloud Run IAM Policy
  - Cloud Spanner
- All other resources are disallowed as per this policy.

## Mandatory labels for Google Cloud resources

- This policy mandates the presence of below labels for the Google Cloud resources being provisioned.
  - environment
  - app_name
  - app_type
  - iRisk_id
  - cost_center
- If any of these mandatory labels are not present or removed from the Terraform code, it will violate the policy.
