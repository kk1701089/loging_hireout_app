class HostsController < ApplicationController
  # logged_in_userをnewとcreateの前に作動させることによりログインしているかチェックしている
  before_action :logged_in_user, only:[:new, :create]

  def index
    @hosts = Host.all
  end

  def show
  end

  def new
    @host = Host.new
  end

  def create
    host = Host.new(host_params)
    host.save!
    redirect_to hosts_url, notice: "ホストとして物件を登録することができました。"
  end

  def edit
  end

  private
  def host_params
    params.require(:host).permit(:room_name,:room_introduction,:room_charge,:room_address,:image)
  end
end
