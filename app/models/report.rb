# class Report
  
#   attr_accessor :id, :name, :start_date

#   @report_method

#   def initialize(id, name, method)  
#     @id = id  
#     @name = name  
#   end  

#   def self.all
#     reports = [Report.new('poundage', 'Donations by Pound', Donation.find_poundage), Report.new('frequency', "")]
#   end

# end
require "reports/poundage"

module Report
  def self.all
    report_keys.map { |k| "Report::#{k}".constantize.new}
  end

  def self.report_keys
    @report_keys ||= ["Poundage"]
  end

  def self.find(class_name, params={})
    class_upper = class_name.capitalize
    if report_keys.include? class_upper
      "Report::#{class_upper}".constantize.new(params)
    else
      raise ActiveRecord::RecordNotFound
    end
  end
end