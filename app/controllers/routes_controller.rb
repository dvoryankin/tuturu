class RoutesController < ApplicationController
  before_action :set_routes, only:[:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @railway_stations = RailwayStation.all
    @route = Route.new
  end

  def edit
  end

  def create
    @railway_stations = RailwayStation.all
    @route = Route.new(route_params)
    if @route.save
      redirect_to @route, notice: 'Маршрут был создан'
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
    redirect_to routes_url, notice: 'Маршрут был удален'
  end

private
  def route_params
    params.require(:route).permit(:title, railway_station_ids: [])
  end

  def set_routes
    @route = Route.find(params[:id])
  end
end
