class Music < ActiveRecord::Base
  scope :british, where('country = "Ireland" OR country = "England" OR country = "Scotland" OR country = "Wales"')
  scope :eighties, where('year < 1990 AND year >= 1980')

  def self.british_from_eighties
    all.british.eighties
  end
end
