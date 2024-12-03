resource "azurerm_linux_virtual_machine" "myvm" {
  count                 = length(azurerm_network_interface.mynetworkinterface)
  name                  = "myvm${count.index + 1}"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  size                  = var.size
  network_interface_ids = [azurerm_network_interface.mynetworkinterface[count.index].id]
  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  disable_password_authentication = false
  source_image_reference {
    publisher = "canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "echo '<h1>Hello, World!</h1>' | sudo tee /var/www/html/index.html",
      "sudo systemctl restart nginx"
    ]
    connection {
      type     = "ssh"
      user     = var.admin_username
      password = var.admin_password
      host     = azurerm_public_ip.mypublicip[count.index].ip_address
    }
  }
  tags = {
    "name" = "myresource"
  }
}
