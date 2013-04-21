class Donation < ActiveRecord::Base
  attr_accessible :description, :poundage, :donated_on, :donor, :value, :donation_method, :donor_id

  belongs_to :donor
  belongs_to :coordinator, class_name: "Donor"
  has_many :line_items

  validates :poundage, numericality: { greater_than_or_equal_to: 0, message: "must be greater than zero" }
  validates :value, numericality: { greater_than_or_equal_to: 0, message: "must be greater than zero", allow_nil: true }
  validates :donor, presence: true

  def initialize(*args)
    super
    self.donated_on ||= Date.today
  end

  DayResult = Struct.new(:day, :count, :poundage, :value) do
    def attributes
      to_h
    end
  end

  def self.donations_by_day(start_on, end_on)
    between_date = where(:donated_on => start_on.to_date..end_on.to_date)
    between_date.group_by{|d| d.donated_on.strftime("%u")}.sort_by(&:first).map{|key,value| DayResult.new(Date::DAYNAMES[key.to_i], value.count, value.map(&:poundage).sum, value.map(&:value).sum)}
  end

  def self.donations_by_zip(start_on, end_on)
    joins(:donor).select("donors.zipcode as zipcode, count(*) as count, sum(poundage) as poundage, sum(value) as value").where(:donated_on => start_on.to_date..end_on.to_date).group("donors.zipcode")
  end

  def self.donations_by_top(start_on, end_on, top_type, direct, coordinated)
    #Todo use direct and coordinated params
    top_donors = joins(:donor).select("IfNull(donors.company, donors.name) as name, count(*) as count, sum(poundage) as poundage, sum(value) as value").group("IfNull(donors.company, donors.name)").where(:donated_on => start_on.to_date..end_on.to_date)
    case top_type
      when "Frequency"
        top_donors.order("count desc").limit(100)
      when "Poundage"
        top_donors.order("poundage desc").limit(100)
      when "Value"
        top_donors.order("value desc").limit(100)
      else
        #throw an error
      end    
  end

  def self.donations_by_poundage
    select("strftime('%Y', donated_on) as year, count(*) as count, sum(poundage) as poundage").group("strftime('%Y', donated_on)")
  end

  def self.units_by_store
   group(:store).sum(:units)
  end
end
