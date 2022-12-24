# Introduction 
This Terraform configuration will create an Azure resource group, a virtual network, and a network security group on Azure.
The configuration begins by specifying the provider and version to use, and then defines the resources that will be created.
The first resource defined is an Azure resource group, which will contain all of the other resources. The name and location of the resource group are set to "Tarun-VN" and "UK South", respectively.
Next, an Azure network security group is created and associated with the resource group. The name and location of the security group are also set to "Tarun-NSG" and "UK South", respectively.
Then, an Azure virtual network is created and associated with the resource group. The name, location, address space, and DNS servers of the virtual network are all specified. The virtual network also has two subnets, both with their own name, address prefix, and security group. The virtual network is also given some tags.
Once you have written this configuration file, you can use Terraform to create the resources on Azure by running the following command: terraform apply. This will create the resources on Azure and output the resulting resource IDs.
