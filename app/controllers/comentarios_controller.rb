class ComentariosController < ApplicationController
def create
  post = Post.find(params[:post_id])
  post.comentarios.create(comentarios_params)

  redirect_to post
end
def destroy
	 @post = Post.find(params[:post_id])
    @comentario = @post.comentario.find(params[:id])
    @comentario.destroy
    redirect_to post_path(@post)
end

private
  def comentarios_params
    params.require(:comentario).permit(:cuerpo).merge(user: current_user)
  end
end
