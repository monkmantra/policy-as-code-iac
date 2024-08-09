package policy

deny[message] {
  some i
  input.resource_changes[i].type != "google_cloud_run_v2_service"
  input.resource_changes[i].type != "google_spanner_database"
  input.resource_changes[i].type != "google_cloud_run_v2_service_iam_policy"
  resource := input.resource_changes[i]
  message := sprintf("Resource type %s is not allowed.",[resource.type])
}
