module "account_ataya_dev" {
  source  = "aws-ia/control_tower_account_factory/aws//modules/aft-account-request-framework"
  version = "1.17.0"

  providers = {
    aws.ct_management = aws.ct_management
  }

  # Obligatoire : paramètres Control Tower pour la création du compte
  control_tower_parameters = {
    AccountEmail              = "finance@activtips.com" # email unique
    AccountName               = "ataya-dev"
    ManagedOrganizationalUnit = "Sandbox" # OU Control Tower
    SSOUserEmail              = "finance@activtips.com"
    SSOUserFirstName          = "Mohamed"
    SSOUserLastName           = "Tounkara"
  }

  # Tagging de base du compte
  account_tags = merge(
    local.default_tags,
    {
      env = "dev"
      app = "ataya"
    }
  )

  # ID du management account où AFT est déployé
  aft_management_account_id = local.aft_management_account_id

  # Optionnel : customisations spécifiques (via AFT)
  # account_customizations_name = "ataya-dev-baseline"
}

output "account_ataya_dev_id" {
  value = module.account_ataya_dev.account_id
}
