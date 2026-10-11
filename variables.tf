variable "ssmcontacts_plans" {
  description = <<EOT
Map of ssmcontacts_plans, attributes below
Required:
    - contact_id
    - stage (block):
        - duration_in_minutes (required)
        - target (optional, block):
            - channel_target_info (optional, block):
                - contact_channel_id (required)
                - retry_interval_in_minutes (optional)
            - contact_target_info (optional, block):
                - contact_id (optional)
                - is_essential (required)
Optional:
    - region
EOT

  type = map(object({
    contact_id = string
    region     = optional(string)
    stage = list(object({
      duration_in_minutes = number
      target = optional(list(object({
        channel_target_info = optional(object({
          contact_channel_id        = string
          retry_interval_in_minutes = optional(number)
        }))
        contact_target_info = optional(object({
          contact_id   = optional(string)
          is_essential = bool
        }))
      })))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ssmcontacts_plans : (
        length(v.stage) >= 1
      )
    ])
    error_message = "Each stage list must contain at least 1 items"
  }
}

