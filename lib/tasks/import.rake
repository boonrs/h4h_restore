namespace :import do
  desc "Imports donor, donation, and category data"
  task :donations => :environment do
    require "csv"
    pairs = CSV.read("data/Donor.csv", headers: true).map do |row|
      id = row["Donor_Number"].to_i
      donor = Donor.new name: "#{row['First_Name']} #{row['Last_Name']}".strip,
                        company: row["Company"],
                        address: row["Address"],
                        city: row["City"],
                        state: row["State"],
                        zipcode: row["Zip"],
                        phone: row["Phone"],
                        email: row["Email"],
                        receive_newsletters: row["Subscribe_Newsletters"] == "Yes",
                        receive_email: row["Subscribe_Email"] == "Yes"
      [id, donor]
    end

    donors = Hash[pairs]

    pairs = CSV.read("data/Donations.csv", headers: true).map do |row|
      id = row["Donation_Number"].to_i
      donor = donors[row["Donor_Number"].to_i]
      donation = Donation.new value: row["Value"].to_i,
                              poundage: row["Weight"].to_i,
                              donated_on: Date.strptime(row["Date"], "%m/%d/%Y"),
                              donor: donor
      donor.donations << donation
      [id, donation]
    end

    donations = Hash[pairs]

    CSV.read("data/Donation_lines.csv", headers: true).each do |row|
      line_item = LineItem.new name: row["Item"],
                               notes: row["notes"],
                               quantity: row["Qty"].to_i
      donations[row["Donation_Number"].to_i].line_items << line_item
    end

    ActiveRecord::Base.transaction do
      donors.each do |key, donor|
        if donor.valid?
          donor.save!
        else
          puts "Donor #{key} is invalid, skipping"
          puts "\t" + donor.errors.full_messages.join(", ")
        end
      end
    end
  end
end
