class Donation < ActiveRecord::Base
  attr_accessible :description, :poundage

  belongs_to :donor
  belongs_to :coordinator, class_name: "Donor"

  validates :description, presence: true
  validates :poundage, presence: true
  validates :donor, presence: true
end
