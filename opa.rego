package policy

deny[message] {
  some i
  input.resource_changes[i].type != "google_cloud_run_v2_service"
  input.resource_changes[i].type != "google_spanner_database"
  resource := input.resource_changes[i]
  message := sprintf("Resource type %s is not allowed.",[resource.type])
}
