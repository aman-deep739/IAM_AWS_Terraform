provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "myuser" {
    name = "Aman"

}

resource "aws_iam_policy" "custom_policy" {
    name = "GlacierEFSEC2"

    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DeleteManagedPrefixList",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:ReplaceRouteTableAssociation",
                "ec2:ModifyManagedPrefixList",
                "ec2:DeleteVpcEndpoints",
                "ec2:ResetInstanceAttribute",
                "ec2:RejectTransitGatewayMulticastDomainAssociations",
                "ec2:ResetEbsDefaultKmsKeyId",
                "ec2:AttachInternetGateway",
                "ec2:ReportInstanceStatus",
                "ec2:ModifyVpnConnectionOptions",
                "ec2:DeleteVpnGateway",
                "ec2:CreateRoute",
                "elasticfilesystem:ClientMount",
                "ec2:DeleteNetworkInsightsAnalysis",
                "ec2:UnassignPrivateIpAddresses",
                "glacier:PurchaseProvisionedCapacity",
                "ec2:CancelExportTask",
                "ec2:DeleteTransitGatewayPeeringAttachment",
                "ec2:ImportKeyPair",
                "ec2:AssociateClientVpnTargetNetwork",
                "ec2:StopInstances",
                "ec2:CreateVolume",
                "ec2:ReplaceNetworkAclAssociation",
                "ec2:CreateVpcEndpointServiceConfiguration",
                "ec2:CreateNetworkInterface",
                "ec2:CancelSpotInstanceRequests",
                "ec2:CreateTransitGatewayRoute",
                "ec2:CreateTransitGatewayVpcAttachment",
                "glacier:SetVaultNotifications",
                "ec2:DeleteDhcpOptions",
                "glacier:CompleteMultipartUpload",
                "ec2:ImportImage",
                "ec2:DeleteVpnConnection",
                "ec2:RejectVpcEndpointConnections",
                "ec2:ModifyEbsDefaultKmsKeyId",
                "ec2:ResetImageAttribute",
                "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
                "ec2:SendDiagnosticInterrupt",
                "ec2:DisableTransitGatewayRouteTablePropagation",
                "glacier:InitiateJob",
                "ec2:CreateVpcEndpointConnectionNotification",
                "glacier:ListTagsForVault",
                "ec2:DeleteNetworkInterface",
                "ec2:CreateFleet",
                "ec2:CreateCustomerGateway",
                "ec2:ModifyHosts",
                "ec2:DeleteTransitGatewayRouteTable",
                "ec2:DeleteTransitGatewayRoute",
                "ec2:DeleteLocalGatewayRoute",
                "ec2:DeleteVpc",
                "ec2:AssociateAddress",
                "ec2:DeleteTransitGateway",
                "ec2:CancelBundleTask",
                "ec2:CreateTrafficMirrorFilter",
                "ec2:DeregisterImage",
                "ec2:PurchaseReservedInstancesOffering",
                "ec2:RequestSpotInstances",
                "ec2:CancelSpotFleetRequests",
                "ec2:DeleteTrafficMirrorTarget",
                "ec2:ReplaceTransitGatewayRoute",
                "ec2:DeleteFpgaImage",
                "ec2:RegisterTransitGatewayMulticastGroupSources",
                "ec2:DisableEbsEncryptionByDefault",
                "ec2:AttachNetworkInterface",
                "glacier:ListProvisionedCapacity",
                "ec2:ResetFpgaImageAttribute"
            ],
            "Resource": "*"
        }
    ]
} 
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
    name = "attachment"
    users = [aws_iam_user.myuser.name]
    policy_arn = aws_iam_policy.custom_policy.arn
}