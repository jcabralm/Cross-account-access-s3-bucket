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
export AWS_ACCESS_KEY_ID=ASIAVVGE2AY5PWOZQO54
export AWS_SECRET_ACCESS_KEY=P4Q+7e8jxUldmSB4UZlhaXf+cLBTSAXdZhounygd
export AWS_SESSION_TOKEN=RoleSeIQoJb3JpZ2luX2VjEOH//////////wEaCXVzLWVhc3QtMSJIMEYCIQC7PhHBx3k/KSW+fmWA36YBgQweeggv+774yzB8memnogIhAI7j6KK4GJKGKie5WRBJUC7iBW6hCfHKVKVhm1PIMysEKpsCCEoQABoMMzg5MTA3Mjg3NjEwIgyqLApqWfmY9EIwq+sq+AEe2MLbZtyA8D9YIS8XQH+NspGwo414+NHzr6UbNLsap/s3yKZSYxgfc50uXIjkk5mnMZB+c3GD1uKA2ivtCEpxaAHuiFRyaYcS4S8HHJInHeuCONfFNbWY29qm4xHHukzDuoxhA1wOE9fZpzZeHfAbPAc5WusTebTSE9miRz4rjy2AelRYJs+lG1rnDixK08tYlbOnbLUtllMnHVujL806/7gg6Zs1EfA9lCUCjHXLL6Oeh044gX+9oD/IK4BArc8qmcbkVZyVfuXsJWNpXlQ5GoOJrsbmkeQNRoFkM/EWZiZthdTyGR1jqCrqbCOVOX1ODyN1HrlzSzD2/uakBjqcAYpw/rX6ibtSij8S3zwOBUgy3WI+s+29mu4Hc6IDebC+E/cPn4+C407lA6bsEEqgdyuNznCjPBWZu5YdwgiEJ4jBVebWkwKAsgV1cnlNqvq0gS3Y8Rabypz6di31wChTE4zfc/llkayeSsfBaN6c01syrMTay4DzZxaTwFj4zebNV3u8NP7/hD9QWADmyxn1UYNeFI2Sys/tIA484Q==ssionToken
# 10 Shows that we're now executing commands as the assumed role
aws sts get-caller-identity
# 11 Run S3 commands to list bucket, make bucket, and delete bucket
aws s3 ls
aws s3 mb s3://test-create-bucket-account-b-e32e090f90d
aws s3 rb s3://test-create-bucket-account-b-e32e090f90d
# 12 Remove environment variables
unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN
# 13 Show that we are now executing commands as our Admin user again
aws sts get-caller-identity