output "kubeconfig" {
  value       = module.cluster.kubeconfig
}

output "cluster_name" {
  value       = module.cluster.cluster_name
}

output "cluster_nodes" {
  value       = module.cluster.cluster_nodes
}

output "vpc_id" {
  value       = module.network.vpc_id
}
