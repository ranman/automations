REGIONLIST=(`echo $(aws ec2 describe-regions --output text --query 'Regions[*].RegionName' | tr -s '\t' ' ')`)

for REGION in "${REGIONLIST[@]}"; do
    aws s3 cp "message_followers.zip" "s3://randhunt-code-${REGION}" --acl public-read --region "${REGION}"
    #aws s3 rb --force "s3://randhunt-code-${REGION}" --region "${REGION}"
    #aws s3 mb "s3://randhunt-code-${REGION}" --region "${REGION}"
done
#aws s3 cp "template.yaml" "s3://randhunt-code/" --acl "public-read"
