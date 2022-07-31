//STEPS set up TGW in shared account (this will be the center or the hub account)

resource "aws_ec2_transit_gateway" "shared_account_tgw" {
  description = "shared account with tgw"
  dns_support = "enable"
  default_route_table_association = "enable"
  vpn_ecmp_support = "enable"
  default_route_table_propagation = "enable"   
  auto_accept_shared_attachments = "enable"

}

//create attachment and associate VPC 

