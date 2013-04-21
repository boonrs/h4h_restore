module Report
  class Poundage
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :start_date, :end_date

    def initialize(args = {})
      @errors = ActiveModel::Errors.new(self)
      #This report doesn't have parameters, no error checking necessary
    end

    def name
      "Estimated Poundage by Year"
    end

    def to_param
      "poundage"
    end

    def title
      name + ' as of ' + Date.today.to_s
    end

    def table_headers
      ["Year", "Count of Donations", "Estimated Poundage"]
    end

    def data
    end

    def params
      false
    end
  end
end