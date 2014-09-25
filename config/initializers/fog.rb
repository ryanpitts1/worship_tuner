CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                                       # required
    :aws_access_key_id      => 'AKIAIVSUZCPPU4XFRSCA',                      # required
    :aws_secret_access_key  => '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',  # required
    #:region                 => 'us-west-1'                                 # optional, defaults to 'us-east-1'
  }
  config.fog_directory = Rails.env == 'production' ? 'WorshipTuner' : 'WorshipTuner-dev'  # required
  #config.fog_host       = 'https://assets.example.com'                                   # optional, defaults to nil
  #config.fog_public     = false                                                          # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}                          # optional, defaults to {}
end