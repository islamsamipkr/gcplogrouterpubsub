variable "pubsub_config" {
  type = map(object({
    pubsub_topic_name          = string
    pubsub_topic_labels        = map(string)
    subscription_labels        = map(string)
    pubsub_subscription_name   = string
  }))
}

# Example value
pubsub_config = [
  "example-config-1" = {
    pubsub_topic_name          = "app_notifications"
    pubsub_topic_labels        = { "env" = "dev" }
    subscription_labels        = { "team" = "analytics" }
    pubsub_subscription_name   = "example-subscription-1"
  }
]

variable "source_project_name"{
type=string
default="dev-office-424702-d0"
}
