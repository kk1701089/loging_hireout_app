class RentalsController < ApplicationController
  def index
  end

  def new
    @rentals = Rental.new
    binding.pry
  end

  def confirm
    binding.pry
    @rentals = Rental.new(rental_params)
    binding.pry
    # valid?はエラーがあればfalseを返す
    # unlessはfalseの時に実行される
    render :new unless @rentals.valid?
  end

  def show
    @rental = Host.find(params[:id])
  end

  def edit
  end

  private
  def rental_params
    params.require(:rental).permit(:rent_room_name, :rent_room_intro,:rent_start_day, :rent_end_day, :rent_room_charge, :people)
  end

end
