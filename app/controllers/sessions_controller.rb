class SessionsController < ApplicationController
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Sign in Successful."
      redirect_to root_path
    else
      flash.now[:notice] = "Incorrect email or password, please try again."
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Sign out successful."
    redirect_to sign_in_path
  end
end