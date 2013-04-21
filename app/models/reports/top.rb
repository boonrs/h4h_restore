module Report
  class Top
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

    def ddl
      ["Frequency", "Poundage", "Value"]
    end

    def name
      "Top 100 Donors"
    end

    def to_param
      "top"
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