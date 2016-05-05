class Booking < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :invoice

  validates :amount, presence: true
end
