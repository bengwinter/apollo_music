class UsersController < ApplicationController

	def index
		if current_user
			@user_client = SoundCloud.new(:access_token => current_user.sc_access_token)
		end
		respond_to do |format|
	      format.html
	  end
	end

	def auth
		sc_client = SoundCloud.new({
			:client_id     => ENV['SOUNDCLOUD_CLIENT_ID'],
			:client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
			:redirect_uri  => 'http://localhost:3000/auth_user',
		})
		tokens = sc_client.exchange_token(:code => params[:code])
		current_user.update(sc_access_token: tokens["access_token"], sc_expiration: tokens["expires_in"], sc_refresh_token: tokens["refresh_token"])
		redirect_to root_url
	end

	def create
		@user = User.create(email: params["email"], password: params["password"])
		cookies.permanent[:auth_token] = @user.auth_token
		sc_client = SoundCloud.new({
			:client_id     => ENV['SOUNDCLOUD_CLIENT_ID'],
			:client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
			:redirect_uri  => 'http://localhost:3000/auth_user',
		})
		@url = sc_client.authorize_url()
		respond_to do |format|
	     format.js {}
	 	end
	end


	private

  def user_params
  	params.require(:user).permit(:email, :password, :sc_access_token)
  end


end