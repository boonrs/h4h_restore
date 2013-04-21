module Report
  class Zip
    include ActiveModel::Validations
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_accessor :start_on, :end_on

    def initialize(args = {})
      @errors = ActiveModel::Errors.new(self)
      puts "=---------=----------" + args.inspect
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
      
    end

    def params
      true
    end
  end
end