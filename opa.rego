package policy

deny[message] {
  some i
  input.resources[i].type != "google_cloud_run_v2_service"
  input.resources[i].type != "google_spanner_database"
  resource := input.resources[i]
  message := sprintf("Resource type %s is not allowed.",[resource.type])
}
