# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
DeviseExample::Application.initialize!


ActionMailer::Base.smtp_settings = {
  :user_name => 'app20890282@heroku.com',
  :password => 'dfjtxuck',
  :domain => 'doozer.co',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
