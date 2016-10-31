class Route < ActiveRecord::Base


  # has_and_belongs_to_many :railway_stations
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :title, presence: true

  before_validation :set_name

  private

  def set_name
    self.name ||= "#{railway_stations.first.name} - #{railway_stations.last.name}"
  end
end