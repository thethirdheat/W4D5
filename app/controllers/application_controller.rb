class ApplicationController < ActionController::Base

  helper_method :auth_token
  helper_method :logged_in?
  helper_method :current_user

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def logged_in?
    !!current_user
  end

  def require_login?
    redirect_to new_session_url if !current_user
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def auth_token
    html = " <input "
    html += " type=\"hidden\" "
    html += " name=\"authenticity_token\" "
    html += " value='<%= #{form_authenticity_token} %>' /> "
    html.html_safe

  end

end
