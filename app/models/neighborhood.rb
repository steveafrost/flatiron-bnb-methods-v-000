class Neighborhood < ActiveRecord::Base
  belongs_to :city
  has_many :listings

  def neighborhood_openings(start_range, end_range)
    self.listings.where()
  end
end
