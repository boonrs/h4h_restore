class Donation < ActiveRecord::Base
  attr_accessible :description, :poundage, :donated_on, :donor, :value

  belongs_to :donor
  belongs_to :coordinator, class_name: "Donor"
  has_many :line_items

  validates :poundage, presence: true
  validates :donor, presence: true
end
