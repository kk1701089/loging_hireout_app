class SessionsController < ApplicationController
  def new
  end

  def create
    # 送られてきたメールアドレスでユーザーを検索する
    user = User.find_by(email: session_params[:email])

    # ユーザーが見つかった場合は、送られてきたパスワードをauthenticateメソッドで認証可能か判断する
    if user&.authenticate(session_params[:password])
      # 認証に成功した場合ユーザーidをセッションに格納
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
  end

  private
  # 送られてきたパラメーターを安全化
    def session_params
      params.require(:session).permit(:email, :password)
    end

end
