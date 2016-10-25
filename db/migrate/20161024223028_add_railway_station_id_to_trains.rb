class AddRailwayStationIdToTrains < ActiveRecord::Migration
  def change
    # add column :trains, :railway_station_id, :integer
    # add_belongs_to :trains, :railway_station #в таблицу trains добавляем связь с таблицей railway_station в единственном числе
    add_belongs_to :trains, :current_station
  end
end
