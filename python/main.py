import boto3
from botocore.exceptions import ClientError

class S3:
  def __init__(self,region):
    self.client = boto3.client('s3',region_name=region)
  
  # List All Bucket
  def list_buckets(self):
    try:
      resp = self.client.list_buckets()
    except ClientError as e:
      print(f"Error listing bucket: {e}")
      return []
    return [bucket['Name'] for bucket in resp['Buckets']]
  
  # Check Bucket is public using get_bucket_policy_status 
  def is_bucket_public(self,bucket):
    try:
      return self.client.get_bucket_policy_status(Bucket=bucket)['PolicyStatus']['IsPublic']
    except self.client.exceptions.from_code('NoSuchBucketPolicy'): 
      pass
    except ClientError as e:
      print(f"Error checking public access of bucket: {e}")
      return None
  
  # List public bucket
  def list_public_bucket(self):
    return [bucket for bucket in self.list_buckets() if self.is_bucket_public(bucket) ]

if __name__=="__main__":
  s3_client = S3('ap-south-1')
  buckets = s3_client.list_public_bucket()
  print(buckets)