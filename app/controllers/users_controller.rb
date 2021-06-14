class UsersController < ApplicationController

  def index
    @users = User.order(id: 'DESC').page(params[:page]).per(15)
  end

  def show
    @user = User.find_by(id: params[:id])
    @questions = @user.questions.order(id: 'DESC').page(params[:page]).per(5)
  end
end
