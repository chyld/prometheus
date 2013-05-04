class UsersController < ApplicationController

  before_filter :check_user_present, :only => [:show]

  def new
    @user = User.new
  end

  def create
    params[:user].each{|k,v| params[:user][k] = v.strip}
    params[:user][:email] = params[:user][:email].downcase
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      Notifications.account_created(@user).deliver
      redirect_to curricula_path
    else
      render :new
    end
  end

  def login
  end

  def authenticate
    user = User.where(email: params[:email].strip).first

    if user.present? && user.authenticate(params[:password].strip)
      session[:user_id] = user.id
      redirect_to curricula_path
    else
      flash[:error] = "The username or password is invalid"
      redirect_to login_users_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def password
  end

  def password_reset
    user = User.where(email: params[:email].strip).first

    if user.present?
      password = (('a'..'z').to_a + ('0'..'9').to_a).shuffle[0..10].join
      user.password = password
      user.password_confirmation = password
      user.save
      Notifications.password_reset(user, password).deliver
      flash[:info] = "Password successfully sent to email"
    else
      flash[:error] = "The email address was not found"
    end

    redirect_to password_users_path
  end

  def show
  end

  def update_email
    @auth.update_attributes(email: params[:email])
  end

  def update_password
    @auth.update_attributes(password: params[:password], password_confirmation: params[:password_confirmation])
  end

  def cancel_subscription
    begin
      customer = Stripe::Customer.retrieve(@auth.customer_id)
      customer.cancel_subscription
      customer = Stripe::Customer.retrieve(@auth.customer_id)
      @auth.plan = nil if customer.subscription.nil?
      @auth.save
      Notifications.plan_cancelled(@auth).deliver
    rescue
    end
  end

  def add_member
    if (@auth.plan.name == 'group') && (@auth.members.count < (@auth.group_size - 1))
      @auth.members << Member.new(email: params[:member_email])
    end
  end

  def delete_member
    member = @auth.members.where(email: params[:member_email]).first
    member.delete if member.present?
  end

  private
  def check_user_present
    redirect_to(root_path) if @auth.nil?
  end
end
