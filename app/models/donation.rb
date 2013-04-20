class Donation < ActiveRecord::Base
  attr_accessible :description, :poundage

  validates :description, presence: true
  validates :poundage, presence: true
end
