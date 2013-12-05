require 'bcrypt'

class User < ActiveRecord::Base
	before_save :encrypt_password
	before_create { generate_token(:auth_token) }
	include BCrypt
	attr_accessor :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :playlist_permissions
  has_many :playlists, through: :playlist_permissions
	# after_create :first_playlists
 

	def generate_token(column)
		begin 
			token = SecureRandom.urlsafe_base64
			self[column] = token
		end while User.exists?(column => self[column])
	end

	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_digest = BCrypt::Engine.hash_secret(password, self.password_salt)
		else
			nil
		end
	end	

	def self.authenticate(email, password)
		user = self.find_by_email(email)
		if user && user.password_digest == ::BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	# private 
	
 #  def first_playlists
 #    self.playlists << Playlist.create(name: "All")
 #    self.playlists << Playlist.create(name: "Favorites")
 #    self.playlists << Playlist.create(name: "Shared")
 #  end


end