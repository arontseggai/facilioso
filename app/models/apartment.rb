class Apartment < ActiveRecord::Base
  belongs_to :user
  has_many :bookings
  has_many :invoices, through: :bookings
end
