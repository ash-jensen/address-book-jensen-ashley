class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?
  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def require_user
    if !signed_in?
      redirect_to sign_in_path
      flash[:notice] = "Please sign in to access this page."
    end
  end
end
