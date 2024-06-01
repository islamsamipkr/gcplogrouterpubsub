variable "pubsub_config" {
  type = map(object({
    pubsub_topic_name          = string
    pubsub_topic_labels        = map(string)
    subscription_labels        = map(string)
    pubsub_subscription_name   = string
  }))
}

# Example value
pubsub_config = {
  "example-config-1" = {
    pubsub_topic_name          = "example-topic-1"
    pubsub_topic_labels        = { "env" = "dev" }
    subscription_labels        = { "team" = "analytics" }
    pubsub_subscription_name   = "example-subscription-1"
  },
  "example-config-2" = {
    pubsub_topic_name          = "example-topic-2"
    pubsub_topic_labels        = { "env" = "prod" }
    subscription_labels        = { "team" = "marketing" }
    pubsub_subscription_name   = "example-subscription-2"
  }
}
