class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      cookies.permanent[:auth_token] = user.auth_token
      redirect_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      redirect_to root_url, :notice => "Login failed. Try again."
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
  
  private
  
  def session_params
    params.permit(:email, :password)
  end

end
