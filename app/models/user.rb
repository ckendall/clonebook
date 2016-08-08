class User < ActiveRecord::Base
	include SessionsHelper

	has_many :posts
	has_many :friendships, :dependent => :destroy
	has_many :friends, :through => :friendships
	has_many :friend_requests, :dependent => :destroy
	has_many :pending_friends, :through => :friend_requests, :source => :friend
	has_many :comments

	has_secure_password

	validates :password, presence: true
	validates :password, length: {minimum: 4}
	validates :email, uniqueness: true
	validates :name, presence: true
	

	validates_confirmation_of :password

end
