require 'spec_helper'

describe Authorization do
  before do
    Authorization.create(:uid => "12345678", :provider => "facebook", :full_name => "Angelina Jolie")
  end

  it { should validate_uniqueness_of(:uid).scoped_to(:provider) }
end
