class Notifications < ActionMailer::Base
  def account_created(user)
    @user = user
    mail :to => user.email, :from => 'support@curricula.io', :subject => "Welcome to Curricula.io"
  end

  def password_reset(user, password)
    @user = user
    @password = password
    mail :to => user.email, :from => 'support@curricula.io', :subject => "Password Reset"
  end
end
