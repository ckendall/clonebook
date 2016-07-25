class PostsController < ApplicationController
	def index
		@posts = Post.all
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
