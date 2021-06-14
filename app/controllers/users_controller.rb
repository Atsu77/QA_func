class UsersController < ApplicationController

  def index
    @users = User.order(id: 'DESC').page(params[:page]).per(15)
  end
end
