package policy

default allow = false
 
# Allowed Terraform resources
allowed_resources := {
  "google_cloud_run_v2_service",
  "google_spanner_database"
}

allow {
  all_resources_allowed(input.resources)
}

all_resources_allowed(resources) {
  some i
  resources[i].type == "google_cloud_run_v2_service"
  resources[i].type == "google_spanner_database"
}

violation[message] {
  some i
  input.resources[i].type != "google_cloud_run_v2_service"
  input.resources[i].type != "google_spanner_database"
  resource := input.resources[i]
  message := sprintf("Resource type %s is not allowed.",[resource.type])
}
