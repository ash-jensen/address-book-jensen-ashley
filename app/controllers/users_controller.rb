class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      user = @user
      session[:user_id] = user.id
      flash[:notice] = "User created."
      redirect_to root_path
    else
      flash[:notice] = "You must enter a valid email and a password."
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end  