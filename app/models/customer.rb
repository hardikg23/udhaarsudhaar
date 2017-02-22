class Customer < ActiveRecord::Base
  validates_presence_of  :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :email,    :within => 3..100
  validates_length_of :mobile,    :is => 10, :allow_blank => true
  validates_format_of :mobile, :with => /\A[0-9]+\Z/, :message => " : Please enter correct mobile No", :allow_blank => true

  class << self

    def to_csv
      require 'csv'
        CSV.generate do |csv|
          csv << ["Id", "Name", "mobile", "Email", "address", "City", "pincode", "cibil_report", "cibil_score", "good_time_to_call", "remarks", "created_at"]
          all.each do |c|
            csv << [c.id, c.name, c.mobile, c.email, c.address, c.city, c.pincode, c.cibil_report, c.cibil_score, c.good_time_to_call, c.remarks, c.created_at]
          end
        end
    end

  end

end
