class FriendshipsController < ApplicationController
	include SessionsHelper

	before_action :set_friend, only: :destroy

	def index
		@friend = current_user.friends
	end

	def destroy
		friend = current_user.friendships.find_by(id: params[:id])

		friend.destroy
		redirect_to posts_path
	end

	private

	def set_friend
		@friend = current_user.friends.find(params[:id])
	end
end
