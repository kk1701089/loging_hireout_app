class ApplicationController < ActionController::Base
# ヘルパーメソッド指定をすることですべてのビューから使用できるようにする。
helper_method :current_user

  private

  def current_user
  # ||=は左辺がnilでなければ右辺を代入するという意味
  # if session[:user_id]
  # @current_user ||= User.find_by(id: session[:user_id])
  # end と同じ
  # ログインしていた場合、Userモデルから
  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # binding.pry
  end

end
