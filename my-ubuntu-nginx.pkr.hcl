 source "yandex" "ubuntu-nginx" {
   token               = "y0_AgAAAABcfcFLAATuwQAAAADebWMgeg9CIUd_RLGxalJlfbQ21eAiH1w"
   folder_id           = "b1gbv6pf9p1849pvo96e"
   source_image_family = "ubuntu-2004-lts"
   ssh_username        = "ubuntu"
   use_ipv4_nat        = "true"
   image_description   = "my custom ubuntu with nginx"
   image_family        = "ubuntu-2004-lts"
   image_name          = "my-ubuntu-nginx"
   subnet_id           = "e9b773gr71f02t067003"
   disk_type           = "network-ssd"
   zone                = "ru-central1-a"
 }

 build {
   sources = ["source.yandex.ubuntu-nginx"]

   provisioner "shell" {
     inline = ["sudo apt-get update -y",
           "sudo apt-get install -y nginx",
           "sudo systemctl enable nginx.service"]
   }
 }
 