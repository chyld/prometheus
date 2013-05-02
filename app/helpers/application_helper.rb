module ApplicationHelper
  def sign_in_toggle
    nav = ''

    if @auth.present?
      nav += "<li>#{link_to('My Account', @auth)}</li>"
      nav += '<li class="divider"></li>'
      nav += "<li class='has-form'>#{link_to('Sign Out', login_users_path, method: 'delete', class: 'button radius alert')}</li>"
    else
      nav += '<li class="has-form"><a href="/users/register" class="button radius success">Sign Up</a></li>'
      nav += '<li class="divider"></li>'
      nav += '<li class="has-form"><a href="/users/login" class="button radius">Sign In</a></li>'
    end
  end
end
