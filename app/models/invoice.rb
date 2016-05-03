class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :cleaning_invoice
  has_many :bookings
  has_many :apartments, through: :bookings
end
