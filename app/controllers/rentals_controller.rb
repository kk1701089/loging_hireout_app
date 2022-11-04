class RentalsController < ApplicationController
  def index
  end

  def new
    @rental = Rental.new
  end

  def show
    @rental = Host.find(params[:id])
  end

  def edit
  end
end
