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
  values = [templatefile("${path.module}/config.yaml", {
    dns_name            = var.dns_name
    auth0_domain        = var.auth0_domain
    auth0_client_id     = var.auth0_client_id
    auth0_client_secret = var.auth0_client_secret
    admin_users         = jsonencode(var.admin_users)
    ml_image            = var.ml_image
  })]
  depends_on = [
    kubernetes_namespace.ml
  ]
}

