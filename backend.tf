terraform {
  backend "local" {
    path = "./.terraform-states/local.tfstates"
  }
}
