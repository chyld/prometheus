class Notifications < ActionMailer::Base
  def account_created(user)
    @user = user
    mail :to => user.email, :from => 'support@curricula.io', :subject => "curricula.io - Welcome"
  end

  def password_reset(user, password)
    @user = user
    @password = password
    mail :to => user.email, :from => 'support@curricula.io', :subject => "curricula.io - Password Reset"
  end

  def plan_purchased(user)
    @user = user
    mail :to => user.email, :from => 'support@curricula.io', :subject => "curricula.io - Subscription Purchased"
  end

  def plan_cancelled(user)
    @user = user
    mail :to => user.email, :from => 'support@curricula.io', :subject => "curricula.io - Subscription Cancelled"
  end
end
