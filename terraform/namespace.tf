resource "kubernetes_namespace" "task_manager" {
  metadata {
    name = "task-manager"
  }
}