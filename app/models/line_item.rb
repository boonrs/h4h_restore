class LineItem < ActiveRecord::Base
  belongs_to :donation
  attr_accessible :name, :notes, :quantity

  validates :name, presence: true
end
