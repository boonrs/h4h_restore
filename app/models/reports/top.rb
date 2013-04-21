module Report
  require "informal"

  class Top
    include Informal::Model

    attr_accessor :start_on, :end_on, :top_type, :donor_direct, :donor_coordinated
    validates :start_on, presence: true
    validates :end_on, presence: true
    validates :top_type, presence: true
    validate :must_have_at_least_one_donor

    def must_have_at_least_one_donor
      if @donor_direct=="0" and @donor_coordinated=="0"
        errors.add(:base, 'You must select at least one donor type: direct or coordinated.')
      end
    end

    def initialize(args = {})
      @errors = ActiveModel::Errors.new(self)
      @start_on = args[:start_on]
      @end_on = args[:end_on]
      @top_type = args[:top_type]
      @donor_direct = args[:donor_direct]
      @donor_coordinated = args[:donor_coordinated]
    end

    def top_types
      ["Frequency", "Poundage", "Value"]
    end

    def name
      "Top 100 Donors"
    end

    def to_param
      "top"
    end

    def title
      name + " (by #{top_type}): " + @start_on + ' - ' + @end_on
    end

    def table_headers
      ["Name", "Count of Donations", "Estimated Poundage", "Estimated Value"]
    end

    def data
      Donation.donations_by_top(@start_on, @end_on, @top_type, @donor_direct, @donor_coordinated)
    end

    def params
      true
    end
  end
end