class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params)
	  if @post.valid?
		  @post.save
	  	  redirect_to post_path(@post)
	  else
		  render :new
	  end
	end

	def update
	  @post = Post.find(params[:id])

	  if @post.update(post_params)
	  	redirect_to post_path(@post)
	  else
		render :edit
	  end
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
