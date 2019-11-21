Workarea.configure do |config|
  # Basic site info
  config.site_name = 'My Store'

  config.host = {
    'test' => 'www.example.com',
    'development' => 'localhost:3000',
    'production' => 'www.my-store.com' # TODO
  }[Rails.env]

  config.email_to = {
    'test'        => "#{config.site_name} <customerservice@example.com>",
    'development' => "#{config.site_name} <customerservice@my_store.test>",
    'production'  => "#{config.site_name} <customerservice@my-store.com>" # TODO
  }[Rails.env]

  config.email_from =  {
    'test'        => "#{config.site_name} <noreply@example.com>",
    'development' => "#{config.site_name} <noreply@my_store.test",
    'production'  => "#{config.site_name} <noreply@my-store.com>" # TODO
  }[Rails.env]
end
