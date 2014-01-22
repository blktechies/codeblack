class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	
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

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)

		if @post.save
			flash[:notice] = "Post has been updated."
			redirect_to @post
		else
			flash[:alert] = "Post has not been updated."
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		flash[:nostice] = "Post has been destroyed."
		redirect_to posts_path
	end
	private
		def post_params
			params.require(:post).permit(:title, :category, :source, :content)
		end

		def set_post
			@post = Post.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			flash[:alert] = "The post you were looking for could not be found."
			redirect_to posts_path
		end
end
