class Donor < ActiveRecord::Base
  attr_accessible :address, :city, :company, :email, :name, :notes, :phone,
    :receive_email, :receive_newsletters, :state, :zipcode

  has_many :donations
  has_many :coordinations, class_name: "Donation"

  validates :zipcode, presence: true

  validate :require_name_or_company

  private

  def require_name_or_company
    if name.blank? && company.blank?
      errors.add :base, "name or company is required"
    end
  end
end
