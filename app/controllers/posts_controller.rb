class PostsController < ApplicationController
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			flash[:notice] = "Post has been created."
			redirect_to @post
		else
			# working on thist still
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private
		def post_params
			params.require(:post).permit(:title, :category, :source, :content)
		end
end
