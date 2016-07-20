class User < ActiveRecord::Base
	has_many :posts
	has_many :friendships
	has_many :friends, :through => :friendships
	has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, :source => :user
	has_many :comments

	has_secure_password

	validates :password, presence: true
	validates :password, length: {minimum: 4}
	validates :email, :username, uniqueness: true
	

	validates_confirmation_of :password
end
