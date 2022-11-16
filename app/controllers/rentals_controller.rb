class RentalsController < ApplicationController

  before_action :logged_in_user, only:[:index, :new, :confirm, :create]

  def index
    @rental = current_user.rentals
    binding.pry
  end

  def new
    @rentals = Rental.new
    binding.pry
  end

  def confirm
    @rentals = current_user.rentals.new(rental_params)
    @room = Host.find(params[:id])
    binding.pry
    # valid?はエラーがあればfalseを返す
    unless @rentals.valid?
      # 入力前の画面に戻す
      render "rooms/show"
    end
  end

  def create
    @rentals = current_user.rentals.new(rental_params)
    # renderで遷移するrooms/showに渡すインスタンス変数を定義する
    @room = Host.find(params[:id])
    binding.pry

    # 戻るボタンが押された時の処理
    if params[:back].present?
      render "rooms/show"
      return
    end

    if @rentals.save
      binding.pry
      redirect_to rentals_path, notice: "予約が完了しました。"
    else
      binding.pry
      render "rooms/show"
    end
  end

  def show
  end

  def edit
  end

  private
  def rental_params
    params.require(:rental).permit(:id,:rent_room_name, :rent_room_intro,:rent_start_day, :rent_end_day, :rent_room_charge, :people)
  end

end
