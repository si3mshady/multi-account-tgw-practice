output "tgw_id" {
  value = aws_ec2_transit_gateway.shared_account_tgw.id
}

output "tgw_arn" {
  value = aws_ec2_transit_gateway.shared_account_tgw.arn
}



#  arn=$(aws ram get-resource-share-invitations --profile dev --region us-west-1 | jq ".resourceShareInvitations[0].resourceShareInvitationArn")


# arn=$(aws ram get-resource-share-invitations --profile dev --region us-west-1 | jq ".resourceShareInvitations[0].resourceShareInvitationArn")

# aws ram accept-resource-share-invitation --resource-share-invitation-arn $(echo $arn) --profile dev --region us-west-1