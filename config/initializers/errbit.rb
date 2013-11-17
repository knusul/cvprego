Airbrake.configure do |config|
  config.api_key = Settings.airbreak.try(:password)
  config.host    = 'err.open.cv'
  config.port    = 80
  config.secure  = config.port == 443
end
