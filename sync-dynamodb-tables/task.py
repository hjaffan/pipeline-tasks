#!/usr/bin/env python

import boto3
import os

# Region 

source_region = os.getenv('SOURCE_REGION')
source_aws_key = os.getenv('SOURCE_AWS_KEY')
source_aws_secret = os.getenv('SOURCE_AWS_SECRET')
source_table = os.getenv('SOURCE_TABLE')

dest_region = os.getenv('DEST_REGION')
dest_aws_key = os.getenv('DEST_AWS_KEY')
dest_aws_secret = os.getenv('DEST_AWS_SECRET')
dest_table = os.getenv('DEST_TABLE')


dynamoclient = boto3.client('dynamodb', region_name=source_region,
    aws_access_key_id=source_aws_key,
    aws_secret_access_key=source_aws_secret)

dynamotargetclient = boto3.client('dynamodb', region_name=dest_region,
    aws_access_key_id=dest_aws_key,
    aws_secret_access_key=dest_aws_secret)

dynamopaginator = dynamoclient.get_paginator('scan')
tabname=source_table
targettabname=dest_table
dynamoresponse = dynamopaginator.paginate(
    TableName=tabname,
    Select='ALL_ATTRIBUTES',
    ReturnConsumedCapacity='NONE',
    ConsistentRead=True
)
for page in dynamoresponse:
    for item in page['Items']:
        print(item)
        # dynamotargetclient.put_item(
        #     TableName=targettabname,
        #     Item=item
        # )