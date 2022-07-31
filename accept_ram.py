import boto3


session = boto3.Session(profile_name='dev',region_name='us-west-1')
ram = session.client('ram')


def getShareInvitationArn():
    return [invitationARN['resourceShareInvitationArn'] for invitationARN in ram.get_resource_share_invitations()['resourceShareInvitations'] if invitationARN['status'] == 'PENDING']
    
    

def run():
    #accept all invitations
    inviation_listing = getShareInvitationArn()
    return [ram.accept_resource_share_invitation(resourceShareInvitationArn=arn) for arn in inviation_listing]



if __name__ == "__main__":
    print(run())


# terraform apply --auto-approve && python3 accept_ram.py && sed -i.tmp 's/#//g' main.tf && terraform apply --auto-approve 

#  aws ram get-resource-share-invitations --profile dev --region us-west-1 | jq ".resourceShareInvitations[0].resourceShareInvitationArn"
#  $(aws ram get-resource-share-invitations --profile dev --region us-west-1 | jq ".resourceShareInvitations[0].resourceShareInvitationArn")