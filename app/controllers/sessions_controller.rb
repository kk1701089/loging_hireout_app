class SessionsController < ApplicationController
  def new
  end

  def create
    # 送られてきたメールアドレスで、Userモデルのemailカラムからユーザーを検索する
    # 該当したユーザーのレコードをuser変数に格納
    user = User.find_by(email: session_params[:email])

    # ユーザーが見つかった場合は、送られてきたパスワードをauthenticateメソッドで認証可能か判断する
    # &.はuser（レシーバ）がnilの場合でもエラーが出ないようにするメソッド
    if user&.authenticate(session_params[:password])
      # 認証に成功した場合ユーザーidをセッションに格納
      session[:user_id] = user.id
      binding.pry
      redirect_to root_path, notice: 'ログインしました'
    else
      render :new, notice: 'ログインに失敗しました'
    end
  end

  def destroy
    reset_session
    binding.pry
    redirect_to root_url, notice: 'ログアウトしました',status: :see_other
  end

  private
  # emailカラムとpasswordカラムだけデータベースに保存
    def session_params
      params.require(:session).permit(:email, :password)
    end

end
