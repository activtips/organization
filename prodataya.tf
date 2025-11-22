module "account_ataya_prod" {
  source  = "aws-ia/control_tower_account_factory/aws//modules/aft-account-request-framework"
  version = "1.17.0"

  providers = {
    aws.ct_management = aws.ct_management
  }

  control_tower_parameters = {
    AccountEmail              = "info@activtips.com"
    AccountName               = "ataya-prod"
    ManagedOrganizationalUnit = "Prod"
    SSOUserEmail              = "info@activtips.com"
    SSOUserFirstName          = "Mohamed"
    SSOUserLastName           = "Tounkara"
  }

  account_tags = merge(
    local.default_tags,
    {
      env      = "prod"
      app      = "ataya"
      critical = "true"
    }
  )

  aft_management_account_id = local.aft_management_account_id

}

output "account_ataya_prod_id" {
  value = module.account_ataya_prod.account_id
}
