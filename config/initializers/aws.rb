credentials = YAML::load_file(Rails.root.join('config', 'amazon_s3.yml'))[Rails.env]

AWS::S3::Base.establish_connection!(
  :access_key_id     => credentials["access_key_id"],
  :secret_access_key => credentials["secret_access_key"]
)
