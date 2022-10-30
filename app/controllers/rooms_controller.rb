class RoomsController < ApplicationController
  def index
    @q = Host.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    binding.pry
  end

  def show
  end

  def new
  end

  def edit
  end
end
