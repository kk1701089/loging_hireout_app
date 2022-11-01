class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    # Userクラスをインスタンス化
    @user = User.new
  end

  def edit
  end
end
