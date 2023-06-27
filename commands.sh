## All commands should be run in ACCOUNT A

# 1 Create user 
aws iam create-user --user-name Cabralj

# ---ligne 2 and ligne 3 you can do them using aws console, if you find somme difficulty  
# 2 Create policy
aws iam create-policy --policy-name Cabralj-s3 --policy-document file://Cabralj-s3.json
# 3 Attach policy
aws iam attach-user-policy --user-name Cabralj --policy-arn "arn:aws:iam::Account (A) ID:policy/Cabralj-s3"
# -------------------
# 4 List policies attached to Cabralj
aws iam list-attached-user-policies --user-name Cabralj
# 5 Create access keys and record access keys for later use
aws iam create-access-key --user-name Cabralj
# 6 Configure CLI with profile for Cabralj
aws configure --profile Cabralj
# 7 Shows the identity being used to execute commands (without any profile)
aws sts get-caller-identity
# 8 Assume the role in Account B with external ID
aws sts assume-role --profile Cabralj --role-arn "arn:aws:iam::Account (B) ID:role/cross-account-s3-access" --role-session-name AWSCLI-Session --external-id XX9812DDF2V
# 9 Configure access key ID, secret access key and session token as environment variables
export AWS_ACCESS_KEY_ID= (ASIAVVGE2AY5PWOZQO54)# must replace what is in parenthese
export AWS_SECRET_ACCESS_KEY=(P4Q+7e8jxUldmSB4UZlhaXf+cLBTSAXdZhounygd) # must replace what is in parenthese
export AWS_SESSION_TOKEN=(RoleSeIQoJb3JpZ2luX2VjElG1rnDixK08tYlbOnbLUtllMnHVujL806/7gg6Zs1EfA9lCUCjHXLL6Oeh044gX+)# must replace what is in parenthese
# 10 Shows that we're now executing commands as the assumed role
aws sts get-caller-identity
# 11 Run S3 commands to list bucket, make bucket, and delete bucket
aws s3 ls
aws s3 mb s3://test-create-bucket-account-b-e32e090f90d
aws s3 rb s3://test-create-bucket-account-b-e32e090f90d
# 12 Remove environment variables
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
# 13 Show that we are now executing commands as our Admin user again
aws sts get-caller-identit
