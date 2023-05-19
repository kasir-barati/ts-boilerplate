variable "FRONTEND_BUCKET_NAME" {
  type = string
}
variable "AWS_ACCESS_KEY_ID" {
  type = string
}
variable "AWS_SECRET_ACCESS_KEY" {
  type = string
}
variable "AWS_REGION" {
  type = string
}
variable "ENV" {
  type = string
}
# You need to add (pass) the root scope variables to their child module (scoped) counterparts
variable "ACCOUNT_NAME" {
  type = string
}
variable "TFSTATE_BUCKET_NAME" {
  type = string
}
