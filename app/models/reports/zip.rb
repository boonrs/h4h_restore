module Report
  require "informal"

  class Zip
    include Informal::Model
    include ActiveModel::Conversion

    attr_accessor :start_on, :end_on
    validates :start_on, presence: true
    validates :end_on, presence: true

    def initialize(args = {})
      @errors = ActiveModel::Errors.new(self)
      @start_on = args[:start_on]
      @end_on = args[:end_on]
    end

    def name
      "Donations by Zip Code"
    end

    def to_param
      "zip"
    end

    def title
      name + ': ' + @start_on + ' - ' + @end_on
    end

    def table_headers
      ["Zip Code", "Count of Donations", "Estimated Poundage", "Estimated Value"]
    end

    def data
      Donation.donations_by_zip(@start_on, @end_on)
    end

    def params
      true
    end
  end
end