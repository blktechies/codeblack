class PostsController < ApplicationController
	def index
		@posts = Post.all
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
			flash[:alert] = "Post has not been created."
			render 'new'
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
