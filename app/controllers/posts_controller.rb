class PostsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	def index
		@post = Post.order(created_at: :desc)
	end
	def new
		@post = current_user.posts.build
	end
	def edit
		@post = Post.find(params[:id])
	end
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	protected
	def post_params
      params.require(:post).permit(:titulo, :texto)
    end
end
