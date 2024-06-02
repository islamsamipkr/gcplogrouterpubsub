pubsub_config = {
  "example-config-1" = {
    pubsub_topic_name          = "app_notifications"
    pubsub_topic_labels        = { "env" = "dev" }
    subscription_labels        = { "team" = "analytics" }
    pubsub_subscription_name   = "example-subscription-1"
  }
}
project_sink_config = [
  {
    project_id        = ""
    project_name      = ""
    pubsub_topic_name = ""
    filter            = "severity>=\"INFO\""
  }]
