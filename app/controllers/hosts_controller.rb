class HostsController < ApplicationController
  # logged_in_userをindexとnewとcreateの前に作動させることによりログインしているかチェックしている
  before_action :logged_in_user, only:[:index,:new, :create]

  def index
    @hosts = current_user.hosts
  end

  def show
  end

  def new
    @host = Host.new
  end

  def create
    @host = current_user.hosts.new(host_params)
    if @host.save
      redirect_to hosts_path, notice: "ホストとして物件を登録することができました。"
    else
      render :new
    end
  end

  def edit
  end

  private
  def host_params
    params.require(:host).permit(:room_name,:room_introduction,:room_charge,:room_address,:image)
  end
end
