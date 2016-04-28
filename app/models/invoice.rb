class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :cleaning_invoice
end
