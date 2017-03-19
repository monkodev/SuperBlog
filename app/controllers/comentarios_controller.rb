class ComentariosController < ApplicationController
def create
  post = Post.find(params[:post_id])
  post.comentarios.create(comentarios_params)

  redirect_to post
end

private
  def comentarios_params
    params.require(:comentario).permit(:cuerpo).merge(user: current_user)
  end
end
