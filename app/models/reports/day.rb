module Report
  require "informal"

  class Day
    include Informal::Model
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :start_on, :end_on
    validates :start_on, presence: true
    validates :end_on, presence: true

    def initialize(args = {})
      @errors = ActiveModel::Errors.new(self)
      @start_on = args[:start_on]
      @end_on = args[:end_on]
    end

    def name
      "Donations by Day"
    end

    def to_param
      "day"
    end

    def title
      name + ": " + @start_on + ' - ' + @end_on
    end

    def table_headers
      ["Day", "Count of Donations", "Estimated Poundage", "Estimated Value"]
    end

    def data
      Donation.donations_by_day(@start_on, @end_on)
    end

    def params
      true
    end
  end
end