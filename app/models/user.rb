class User < ActiveRecord::Base
	has_many :posts
	has_many :friends

	has_secure_password

	validates :password, :username, presence: true
	validates :password, length: {minimum: 4}

	validates_confirmation_of :password
end
