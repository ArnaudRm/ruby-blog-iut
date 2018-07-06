class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :own_user, only: [:edit, :update]

  def index
    @users = User.order(:lastname).all
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.update_attributes user_params

    if @user.save
      redirect_to @user
    else
      render "new"
    end
  end

  def show
    @posts = Post.where(:user => @user)
  end

  def update
    if @user.update_attributes user_params
      redirect_to user_path
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def own_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to @user, notice: "Vous ne pouvez pas editer cet utilisateur !"
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :avatar)
  end

end
