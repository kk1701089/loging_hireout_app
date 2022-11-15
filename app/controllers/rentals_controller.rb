class RentalsController < ApplicationController

  before_action :logged_in_user, only:[:new, :confirm, :create]

  def index
  end

  def new
    @rentals = Rental.new
    binding.pry
  end

  def confirm
    @rentals = Rental.new(rental_params)
    @room = Host.find(@rentals[:id])
    binding.pry
    # valid?はエラーがあればfalseを返す
    unless @rentals.valid?
      binding.pry
      # 入力前の画面に戻す
      render "rooms/show"
    end
  end

  def create
    @rentals = Rental.new(rental_params)
    @room = Host.find(@rentals[:id])
    if @rentals.save
      binding.pry
      redirect_to @rentals, notice: "予約が完了しました。"
    else
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
