ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :domain               => "fronnect.herokuapp.com",
  :user_name            => ENV["sendgrid_username"],
  :password             => ENV["sendgrid_password"],
  :authentication       => "plain",
  :enable_starttls_auto => true
}
