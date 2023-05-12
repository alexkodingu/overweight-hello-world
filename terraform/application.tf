#resource "helm_release" "nginx" {
#  name       = "nginx"
#  repository = "https://charts.bitnami.com/bitnami"
#  chart      = "nginx"
#
#  values = [
#    file("nginx-values.yaml")
#  ]
#}