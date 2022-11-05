class RoomsController < ApplicationController
# 各アクションが動作する前に
  before_action :search

  def index
    
  end

  def search
    @q = Host.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    # binding.pry
  end

  def show
    # binding.pry
    @room = Host.find(params[:id])
    # binding.pry
  end

  def new
  end

  def edit
  end
end
