class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods

  def city_openings(start_range, end_range)
  end

  def self.highest_ratio_res_to_listings
  end

  def self.most_res
  end

end

