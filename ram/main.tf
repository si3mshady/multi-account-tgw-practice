resource "aws_ram_resource_share" "king_ram" {
#    provider = aws.default
  name                      = "shared_vpc_tgw_resource_share"
  allow_external_principals = true
  

  tags = {
    Environment = "Production"
  }
}



resource "aws_ram_principal_association" "principal_association_invitation" {
#   provider = aws.default
  principal          = "698347480743"
  resource_share_arn = aws_ram_resource_share.king_ram.arn
}


resource "aws_ram_resource_association" "resource_association" {
  resource_arn       = var.tgw_arn
  resource_share_arn = aws_ram_resource_share.king_ram.arn
}


# resource "time_sleep" "wait_180_seconds" {
#   depends_on = [null_resource.accept]

#   create_duration = "180s"
 
# }




# resource "aws_ram_resource_share_accepter" "receiver_accept" {
#   share_arn = aws_ram_principal_association.principal_association_invitation.resource_share_arn
# }



# resource "null_resource" "accept" {
#   # Changes to any instance of the cluster requires re-provisioning
  

#   provisioner "local-exec" {


#  arn=$(aws ram get-resource-share-invitations --profile dev --region us-west-1 | jq ".resourceShareInvitations[0].resourceShareInvitationArn") && \



# arn=$(aws ram get-resource-share-invitations --profile dev --region us-west-1 | jq ".resourceShareInvitations[0].resourceShareInvitationArn")

# aws ram accept-resource-share-invitation --resource-share-invitation-arn $(echo $arn) --profile dev --region us-west-1
#     command = "aws ram accept-resource-share-invitation --resource-share-invitation-arn ${aws_ram_principal_association.principal_association_invitation.resource_share_arn} --profile dev --region us-west-1"
#   }
# }
# provider "aws" {
#   alias = "default"
#   profile = "default"
# }


#   aws ram accept-resource-share-invitation --resource-share-invitation-arn "arn:aws:ram:us-west-1:596780849713:resource-share/f9c98415-1d67-4720-be64-ef8d64b528f0"


# aws ram accept-resource-share-invitation --resource-share-invitation-arn