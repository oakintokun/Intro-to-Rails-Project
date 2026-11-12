Rails.application.configure do
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.log_level = :info
  config.assume_ssl = false
  config.force_ssl = false
  config.public_file_server.enabled = true
end
