class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  before_action :own_post, only: [:edit, :delete]

  def index
    @posts = Post.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
  end


  def new
    @post = current_user.posts.new
  end

  def edit
  end

  def destroy
    if Post.find(params[:id]).destroy
      redirect_to current_user, notice: 'Post supprimé avec succès.'
    end
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post crée avec succès.'
    else
      render :new
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :picture, :chapeau)
  end

  def own_post
    @post = Post.find(params[:id])

    if current_user != @post.user
      redirect_to @post, notice: "Vous ne pouvez pas editer ou supprimer ce post !"
    end
  end

end
