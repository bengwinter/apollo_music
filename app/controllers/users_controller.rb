class UsersController < ApplicationController

	def index
		respond_to do |format|
	      format.html
	  end
	end

	def soundcloud_authorize

		callback_url ='http://localhost:3000/auth_user'

		client = SoundCloud.new({
		  :client_id     => ENV['SOUNDCLOUD_CLIENT_ID'],
		  :client_secret => ENV['SOUNDCLOUD_CLIENT_SECRET'],
		  :redirect_uri  => callback_url,
		})

		redirect_to client.authorize_url()

	end


	def auth
		@user = User.new
		@code = params["code"]
		respond_to do |format|
      format.html
    end
	end

	def create
		User.create(email: params["email"], password: params["password"], sc_access_token: params[:sc_access_token])
		redirect_to root_path
	end


	private

  def user_params
  	params.require(:user).permit(:email, :password, :sc_access_token)
  end


end