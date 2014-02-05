ActionMailer::Base.smtp_settings = {
  :address              => "smtp.sendgrid.net",
  :port                 => 587,
  :domain               => "fronnect.herokuapp.com",
  :user_name            => "ntaneja",
  :password             => "bronco$",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
