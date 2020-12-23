Rails.application.config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
  g.javascripts false
  g.stylesheets false
  g.assets false
  g.helper false
end
