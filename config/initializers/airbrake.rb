Airbrake.configure do |config|
  config.api_key = '076c9f345d71448eaae86738e7f35d43'
  config.host    = 'errbit.hnd.sm.ua'
  config.port    = 80
  config.secure  = config.port == 443
end
