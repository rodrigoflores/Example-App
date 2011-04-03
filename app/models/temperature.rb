class Temperature < ActiveRecord::Base
  validates_presence_of :temperature_in_celsius
  composed_of :temperature_converter, :mapping => %w(temperature_in_celsius temperature)
  delegate :in_fahrenheit, :in_celsius, :in_kelvin, :to => :temperature_converter
end
