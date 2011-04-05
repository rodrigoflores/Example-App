class Authorization < ActiveRecord::Base
  validates_uniqueness_of :uid, :scope => :provider
end
