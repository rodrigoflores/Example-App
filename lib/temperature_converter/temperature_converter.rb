class TemperatureConverter
  def initialize(temperature)
    @temperature = temperature
  end

  def in_fahrenheit
    (9.0/5.0)*@temperature + 32.0
  end

  def in_kelvin
    @temperature + 273.15
  end

  def in_celsius
    @temperature
  end
end