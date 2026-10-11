output "ssmcontacts_plans_id" {
  description = "Map of id values across all ssmcontacts_plans, keyed the same as var.ssmcontacts_plans"
  value       = { for k, v in aws_ssmcontacts_plan.ssmcontacts_plans : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ssmcontacts_plans_contact_id" {
  description = "Map of contact_id values across all ssmcontacts_plans, keyed the same as var.ssmcontacts_plans"
  value       = { for k, v in aws_ssmcontacts_plan.ssmcontacts_plans : k => v.contact_id if v.contact_id != null && length(v.contact_id) > 0 }
}
output "ssmcontacts_plans_region" {
  description = "Map of region values across all ssmcontacts_plans, keyed the same as var.ssmcontacts_plans"
  value       = { for k, v in aws_ssmcontacts_plan.ssmcontacts_plans : k => v.region if v.region != null && length(v.region) > 0 }
}
output "ssmcontacts_plans_stage" {
  description = "Map of stage values across all ssmcontacts_plans, keyed the same as var.ssmcontacts_plans"
  value       = { for k, v in aws_ssmcontacts_plan.ssmcontacts_plans : k => v.stage if v.stage != null && length(v.stage) > 0 }
}

