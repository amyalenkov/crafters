class AdminMailer < ActionMailer::Base
  default from: "admin@example.com"
  default to: "admin@example.com"

  def check_crafter
    mail(:subject => 'check  crafter')
  end

  def successful_checked email
    mail(:to => email, :subject => 'successful checked')
  end

  def fail_checked email
    mail(:to => email, :subject => 'fail checked')
  end
end
