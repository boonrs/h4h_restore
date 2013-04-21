require "reports/poundage"
require "reports/zip"
require "reports/top"
require "reports/day"

module Report
  def self.all
    report_keys.map { |k| "Report::#{k}".constantize.new}
  end

  def self.report_keys
    @report_keys ||= ["Poundage", "Zip", "Top", "Day"]
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