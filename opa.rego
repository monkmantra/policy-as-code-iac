package terraform
 
import input.tfplan as tfplan

# default allow = false

# Allowed Terraform resources
allowed_resources = [
	# Cloud Run
        "google_cloud_run_v2_service",

    # Cloud spanner database
        "google_spanner_database"
]

allowed_region = [
    # Approved region
    "us-east4"
]    

array_contains(arr, elem) {
	arr[_] = elem
}

deny[reason] {
  resource := tfplan.resource_changes[_]
  action := resource.change.actions[count(resource.change.actions) - 1]
  array_contains(["create", "update"], action)  # allow destroy action

  not array_contains(allowed_resources, resource.type)

  reason := sprintf(
    "%s: resource type %q is not allowed in this project.",
    [resource.address, resource.type]
  )
}

allow {
  not deny
}