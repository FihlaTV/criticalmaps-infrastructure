variable "do_token" {}
variable "ssh_fingerprint" {}
variable "pub_key" {}
variable "pvt_key" {}

provider "digitalocean" {
  token = "${var.do_token}"
}
