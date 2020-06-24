provider "aws" {
  region = var.region
}

module "network" {
  source     = "..//modules/network"
  
  cidr_block = "10.0.0.0/16"
  tags       = { "kubeadm:cluster" = module.cluster.cluster_name }
}

module "cluster" {
  source    = "../"
  
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_id
}
