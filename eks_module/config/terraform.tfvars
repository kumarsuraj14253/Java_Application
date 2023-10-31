
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "SpringBoot_Application_EKS"
        eks_subnet_ids           = ["subnet-00d9f51f182f5dbba","subnet-07ff46336b0fbe20","subnet-0af35268af46449e1"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "demo-nodes" = {

        eks_cluster_name         = "SpringBoot_Application_EKS"
        node_group_name          = "Nodes_For_SpringBootApplication"
        node_iam_role           = "eks-node-group-general"
        node_subnet_ids          = ["subnet-00d9f51f182f5dbba","subnet-07ff46336b0fbe20","subnet-0af35268af46449e1"]

        tags = {
             "Name" =  "demo-nodes"
         } 
  }
}