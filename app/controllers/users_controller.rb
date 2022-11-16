class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    # Userクラスをインスタンス化
    @user = User.new
  end

  def create
    # privateメソッドにより安全化されたuserパラメーターをuser_paramsメソッドで取得して、Userオブジェクトを作成する
    @user = User.new(user_params)
    # binding.pry
    # save!メソッドでデータベースに登録
    if @user.save
      # トップ画面に遷移
      redirect_to root_path,notice: "登録に成功しました"
    else
      render :new
    end
  end

  def edit
  end

  private
  # user_paramsメソッドで指定したカラム名以外の登録をできなくする
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
