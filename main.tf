resource "kubernetes_namespace" "ml" {
  metadata {
    name = "ml"
    labels = {
      shared-gateway-access = "true"
      istio-injection       = "disabled"
    }
  }
}

# resource "kubectl_manifest" "peer_auth" {
#   yaml_body  = file("${path.module}/peerauthentication.yaml")
#   depends_on = [kubernetes_namespace.ml]
# }

resource "helm_release" "jupyterhub" {
  repository = "https://jupyterhub.github.io/helm-chart/"
  chart      = "jupyterhub"
  version    = "3.2.1"
  namespace  = "ml"
  name       = "jupyterhub"
  values     = [file("config.yaml")]
  depends_on = [
    kubernetes_namespace.ml
  ]
}

