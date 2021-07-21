class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.order(id: 'DESC').page(params[:page]).per(15)
  end

  def show
    @user = User.find_by(id: params[:id])
    @questions = @user.questions.order(id: 'DESC').page(params[:page]).per(5)
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報を変更しました'
    else
      render action: :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
