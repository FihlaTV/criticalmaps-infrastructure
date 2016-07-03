resource "digitalocean_domain" "default" {
    name = "criticalmaps.net"
    ip_address = "${digitalocean_floating_ip.foobar.ip_address}"
}

resource "digitalocean_record" "adsf-foobar" {
  domain = "${digitalocean_domain.default.name}"
  type = "A"
  name = "example"
  value = "${digitalocean_floating_ip.foobar.ip_address}"
}
