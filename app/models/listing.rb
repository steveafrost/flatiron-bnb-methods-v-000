class Listing < ActiveRecord::Base
  belongs_to :neighborhood
  belongs_to :host, :class_name => "User"
  has_many :reservations
  has_many :reviews, :through => :reservations
  has_many :guests, :class_name => "User", :through => :reservations

  validates :address, :listing_type, :title, :description, :price, :neighborhood, presence: true

  after_save :set_host
  before_destroy :remove_host

  def set_host
    self.host.update(host: true)
  end

  def remove_host
    self.host.update(host: false) if self.host.listings.size == 1
  end

  def average_review_rating
    reviews.average(:rating)
  end
end
