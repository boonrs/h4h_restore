class LineItem < ActiveRecord::Base
  belongs_to :donation
  attr_accessible :name, :notes, :quantity

  validates :name, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0, message: "must be greater than zero" }
end
