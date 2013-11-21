class CreatesController < ApplicationController
  def index
    @creates = Create.all
  end

  def show
    @create = Create.find(params[:id])
  end

  def new
  end

  def edit
  end
end
