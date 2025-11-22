provider "aws" {
  region = "eu-west-1"

}

provider "aws" {
  alias  = "ct_management"
  region = "eu-west-1"
}
