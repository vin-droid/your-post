class PostsController < ApplicationController
  
  before_action :authenticate_user!	
  before_action :find_post, only:[:show,:edit,:update,:destroy]



	def index
		@posts = Post.all  
	end

	def show
	end
	def create
		@post = Post.new(content: params[:content])
		if @post.save
			redirect_to @post
		else
			render new
	end

	def new
		@post= Post.new
	end

	def destroy
		if @post.destroy
			redirect_to '/'
	end

	def edit
	end

	def update
		if @post.update
			redirect_to '/'
	end

	private

	def find_post
		 @post = Post.find(params[:id])
	end
	def find_params
		params.require(:post).permit(:id,:conent)
	end
end
