module "app-pubsub" {
  source   = "terraform-google-modules/pubsub/google"
  version  = "~> 5.0"
  for_each = { for x, n in var.pubsub_config : x => n }
  project_id = var.project_id
  grant_token_creator = false
  topic               = each.value.pubsub_topic_name
  topic_labels        = each.value.pubsub_topic_labels
  subscription_labels = each.value.subscription_labels

  pull_subscriptions = [
    {

      name = each.value.pubsub_subscription_name

      message_retention_duration = "604800s" // Default (7 days)
      retain_acked_messages      = false     // Default
      ack_deadline_seconds       = 10        // Default
      expiration_policy          = ""        // Subscription never expires
      max_delivery_attempts = 5      // Default
      minimum_backoff       = "10s"  // Default
      maximum_backoff       = "600s" // Default

      enable_message_ordering      = true
      enable_exactly_once_delivery = true

      service_account = var.pubsub_subscription_sa
    }
  ]


}
 

resource "google_logging_project_sink" "app_project_sink" {
  for_each    = { for x, n in var.project_sink_config : x => n }
  name        = "${each.value.project_name}-logsink-${index(var.project_sink_config, each.value) + 1}"
  description = "Project sink for ${each.value.project_name}"
  destination = "pubsub.googleapis.com/projects/${var.project_id}/topics/${each.value.pubsub_topic_name}"

  filter                 = each.value.filter
  project                = each.value.project_id
  custom_writer_identity="serviceAccount:logrouter-pubsub@uclodia-424702.iam.gserviceaccount.com"

}


resource "google_pubsub_topic_iam_binding" "project_sink_writer" {
  for_each = { for x, n in google_logging_project_sink.app_project_sink : x => n }
  project  = var.project_id
  topic    = element(split("/", each.value.destination), length(split("/", each.value.destination)) - 1)
  role     = "roles/pubsub.publisher"
  members = [
    each.value.writer_identity
  ]
  }
