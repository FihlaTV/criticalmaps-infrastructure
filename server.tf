resource "digitalocean_droplet" "asdf-foo" {
  image = "ubuntu-14-04-x64"
  name = "asdf"
  region = "fra1"
  size = "512mb"
  private_networking = true
  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    user = "root"
    type = "ssh"
    key_file = "${var.pvt_key}"
    timeout = "2m"
  }

  provisioner "file" {
      source = "bin"
      destination = "/criticalmaps"
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "chmod +x /criticalmaps/bootstrap.sh",
      "sudo /criticalmaps/bootstrap.sh"
    ]
  }
}

resource "digitalocean_floating_ip" "foobar" {
    droplet_id = "${digitalocean_droplet.asdf-foo.id}"
    region = "${digitalocean_droplet.asdf-foo.region}"
}
