class Donation < ActiveRecord::Base
  attr_accessible :description, :poundage, :donated_on, :donor, :value, :donation_method, :donor_id

  belongs_to :donor
  belongs_to :coordinator, class_name: "Donor"
  has_many :line_items

  validates :poundage, numericality: { greater_than_or_equal_to: 0, message: "must be greater than zero" }
  validates :value, numericality: { greater_than_or_equal_to: 0, message: "must be greater than zero", allow_nil: true }
  validates :donor, presence: true

  def initialize(*args)
    super
    self.donated_on ||= Date.today
  end

  def self.donations_by_day(start_on, end_on)
  end

  def self.donations_by_zip(start_on, end_on)
    #["Zip Code", "Count of Donations", "Estimated Poundage", "Estimated Value"]
    joins(:donor).select("donors.zipcode as zipcode, count(*) as count, sum(poundage) as poundage, sum(value) as value").group("donors.zipcode")
  end

  def self.donations_by_top(start_on, end_on, top_type, direct, coordinated)
  end

  def self.donations_by_poundage
    select("strftime('%Y', donated_on) as year, count(*) as count, sum(poundage) as poundage").group("strftime('%Y', donated_on)")
  end

def self.units_by_store
 group(:store).sum(:units)
end
end
