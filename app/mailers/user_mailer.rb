class UserMailer < ActionMailer::Base
    default :from => 'paijem@gmail.com'
    layout 'mailer'
    def registration_confirmation(user)
        @user = user
        mail(:to => "#{user.email}", :subject => "PLEASE CONFIRM YOUR REGISTRATION")
  end
end
  