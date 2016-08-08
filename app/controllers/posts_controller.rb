class PostsController < ApplicationController

	include SessionsHelper


	def index
		@friends = Friendship.where(friend_id: current_user.id)
		@posts = Post.where(user_id: current_user)
		@user = current_user
		
		@incoming = FriendRequest.where(friend: current_user)
	
		@outgoing = current_user.friend_requests
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
		@comment = @post.comments.build
		@comments = Comment.where(post_id: @post.id)
	end


	def create

		@post = Post.new(post_params)
		@post.user_id = session[:id]

		if @post.save
			redirect_to posts_path
		else
			flash[:error] = @post.errors.full_messages.to_sentence
		end
	end

	private

  	def post_params
    	params.require(:post).permit(:body)
  	end

end
