class AddRailwayStationIdToTrains < ActiveRecord::Migration
  def change
    # add column :trains, :railway_station_id, :integer
    add_belongs_to :trains, :railway_stations #in table trains add link
  end
end
