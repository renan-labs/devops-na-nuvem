output "dlqueues_urls" {
  value = aws_sqs_queue.deadletter.*.id
}

output "queues_urls" {
  value = aws_sqs_queue.nsse.*.id
}

output "sns_topic_arn" {
  value = aws_sns_topic.order_confirmed_topic.id
}

output "s3_application_bucket_name" {
  value = aws_s3_bucket.nsse.bucket
}

output "rds_cluster_endpoint"{
  value = aws_rds_cluster.this.endpoint
}