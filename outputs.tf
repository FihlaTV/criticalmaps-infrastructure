output "ip" {
  value = "${digitalocean_floating_ip.foobar.ip_address}"
}
