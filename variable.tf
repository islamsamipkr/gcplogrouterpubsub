variable "pubsub_config" {
  type = map(object({
    pubsub_topic_name          = string
    pubsub_topic_labels        = map(string)
    subscription_labels        = map(string)
    pubsub_subscription_name   = string
  }))
}

# Example value
variable "project_sink_config"{

}
variable "pubsub_subscription_sa"{}
variable "project_id"{default="dev-office-424702-d0"}
