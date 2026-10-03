resource "kubernetes_resource_quota" "task_manager" {
  metadata {
    name      = "task-manager-quota"
    namespace = kubernetes_namespace.task_manager.metadata[0].name
  }

  spec {
    hard = {
      "requests.cpu"    = "2"
      "requests.memory" = "2Gi"
      "limits.cpu"      = "4"
      "limits.memory"   = "4Gi"
      "pods"            = "20"
    }
  }
}