CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIA55SJQ2ZE2YEIN74T',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 's3-group'
  config.cache_storage = :fog
end