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
    project_id        = "uclodia-424702"
    project_name      = "uclodia"
    pubsub_topic_name = "app_notifications"
    filter            = "severity>=\"INFO\""
  }]
pubsub_subscription_sa="internalsa@dev-office-424702-d0.iam.gserviceaccount.com"
