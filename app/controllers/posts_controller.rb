class PostsController < ApplicationController
	def index
		@posts = Posts.all
	end

	def new
		
		@post = Post.new
	end

	def show
	end


	def create
		puts "*" *80
		puts params
		puts "*"*80
		@posts = Post.all
		@post = Post.new(post_params)

		if @post.save
			flash[:success] = "You made a new post"
			render "users/index"
		else
			flash[:error] = @post.errors.full_messages.to_sentence
		end
	end

	private

  	def post_params
    	params.require(:post).permit(:body)
  	end

end
