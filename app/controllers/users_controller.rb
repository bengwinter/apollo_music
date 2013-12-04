class UsersController < ApplicationController

	def index
		if current_user
			@user_client = SoundCloud.new(:access_token => current_user.sc_access_token)
		end
		respond_to do |format|
	      format.html
	  end
	end

	def soundcloud_authorize
		redirect_to SOUNDCLOUD_CLIENT.authorize_url()
	end


	def auth
		@user = User.new
		tokens = SOUNDCLOUD_CLIENT.exchange_token(:code => params[:code])
		@access_token = tokens["access_token"]
		@expiration = tokens["expires_in"]
		@refresh_token = tokens["refresh_token"]
		respond_to do |format|
      format.html
    end
	end

	def create
		@user = User.create(email: params["email"], password: params["password"], sc_access_token: params[:access_token], sc_expiration: params[:expiration], sc_refresh_token: params[:refresh_token])
		cookies.permanent[:auth_token] = @user.auth_token
		respond_to do |format|
      format.html
    end	
	end


	private

  def user_params
  	params.require(:user).permit(:email, :password, :sc_access_token)
  end


end