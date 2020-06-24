provider "aws" {
  region = var.region
}

module "network" {
  source     = "/home/kishor/Downloads/dedvpc//modules/network"
  
  cidr_block = "10.0.0.0/16"
  tags       = { "kubeadm:cluster" = module.cluster.cluster_name }
}

module "cluster" {
  source    = "/home/kishor/Downloads/dedvpc"
  
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}
