package policy

# Deny creating not-allowed resources
denyresource[message] {
  some i
  input.resource_changes[i].type != "google_cloud_run_v2_service"
  input.resource_changes[i].type != "google_spanner_database"
  input.resource_changes[i].type != "google_cloud_run_v2_service_iam_policy"
  resource := input.resource_changes[i]
  message := sprintf("Resource type %s is not allowed.",[resource.type])
}

# Deny deleting required labels
denyremovaloflabels[msg] {
 changeset := input.planned_values.root_module.resources[_]
 
 # Ignore if block is data 
 split(changeset.address, ".")[0] != "data"

 changeset.type == "google_cloud_run_v2_service"
 
 # Ignore if resource doesn't support labels
 changeset.values.template[0].labels
 changeset.values.template[0].labels != null

 required_labels := { "environment", "app_type", "cost_center", "irisk_id", "app_name" }
 
 provided_labels := {label | changeset.values.labels[label]}

 missing_labels := required_labels - provided_labels

 count(missing_labels) > 0

 msg := sprintf("%v is missing required label(s): %v", [changeset.address,concat(", ", missing_labels)])
}
