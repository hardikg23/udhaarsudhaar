class Customer < ActiveRecord::Base
  validates_presence_of  :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :email,    :within => 3..100
  validates_length_of :mobile,    :is => 10, :allow_blank => true
  validates_format_of :mobile, :with => /\A[0-9]+\Z/, :message => " : Please enter correct mobile No", :allow_blank => true
end
