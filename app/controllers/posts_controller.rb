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
	def show
		@post = Post.find(params[:id])
	end
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			redirect_to posts_path, notice: "El post se ingreso correctamente"
		else
			render :new
		end
	end
	def destroy
		post = Post.find(params[:id])
		comment = post.comentarios
        comment.destroy
    	post.destroy
    	redirect_to posts_path, notice: "El post y los comentarios asociados se eliminaron correctamente"
	end
	def update
		@post = Post.find(params[:id])
    	if @post.update(post_params)
      		redirect_to posts_path, notice: "El post ha sido modificado"
    	else
      		render :edit
    	end
	end

	protected
	def post_params
      params.require(:post).permit(:titulo, :texto)
    end
end
