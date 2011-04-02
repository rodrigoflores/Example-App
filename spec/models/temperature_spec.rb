require 'spec_helper'

describe Temperature do
  it { should validate_presence_of :temperature_in_celsius }

  describe "#temperature_in_fahrenheit" do
    it 'should convert 0.00 to 32.0' do
      temperature = Temperature.create(:temperature_in_celsius => 0.00)
      temperature.temperature_in_fahrenheit.should == 32.0
    end

    it 'should convert 100.0 to 212' do
      temperature = Temperature.create(:temperature_in_celsius => 100.00)
      temperature.temperature_in_fahrenheit.should == 212.0
    end
  end

  describe "#temperature_in_kelvin" do
    it 'should convert 0.00 to 273.15' do
      temperature = Temperature.create(:temperature_in_celsius => 0.00)
      temperature.temperature_in_kelvin.should == 273.15
    end

    it 'should convert 100.00 to 373.15' do
      temperature = Temperature.create(:temperature_in_celsius => 100.00)
      temperature.temperature_in_kelvin.should == 373.15
    end
  end
end
