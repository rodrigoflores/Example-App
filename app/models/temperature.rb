class Temperature < ActiveRecord::Base
  validates_presence_of :temperature_in_celsius

  def temperature_in_fahrenheit
    (9.0/5.0)*temperature_in_celsius + 32.0
  end

  def temperature_in_kelvin
    temperature_in_celsius + 273.15
  end
end
