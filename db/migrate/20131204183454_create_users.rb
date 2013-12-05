class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text   :first_name
	    t.text   :last_name
	    t.text :zip 
	    t.text   :image, default: 'http://s3.amazonaws.com/ApolloApp/Landing+Page/blank_avatar.png'
      t.string :password_digest
      t.string :password_salt	
      t.string :sc_access_token
      t.string :sc_expiration
      t.string :sc_refresh_token
      t.string :auth_token
      t.text :favorites, array: true, default: []
      t.timestamps
    end
  end
end
