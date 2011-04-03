class Temperature < ActiveRecord::Base
  validates_presence_of :temperature_in_celsius
  composed_of :temperature_converter, :mapping => %w(temperature_in_celsius temperature)

end
