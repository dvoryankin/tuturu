class RoutesController < ApplicationController
  def index
    @routes = RailwayStation.all
  end

  def show
    @route = RailwayStation.find(params[:id])
  end

  def new
    @route = RailwayStation.new
  end

  def create
    @route = RailwayStation.new(route_params)
    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      render :new
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_url, notice: 'Станция была удалена'
  end

  private
  def route_params
    params.require(:route).permit(:title)
  end

  def set_routes
    @route = RailwayStation.find(params[:id])
  end
end

