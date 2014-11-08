CarrierWave.configure do |config|
  if Rails.env.staging? || Rails.env.production?
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => Rails.application.secrets.S3_KEY,                        # required
      :aws_secret_access_key  => Rails.application.secrets.S3_SECRET,                        # required
    }
    config.fog_directory  = 'beautysalon2'                     # required
  else
    config.storage = :fog
    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => Rails.application.secrets.S3_KEY,                        # required
      :aws_secret_access_key  => Rails.application.secrets.S3_SECRET,                        # required
    }
    config.fog_directory  = 'posplus'                     # required
  end

end

