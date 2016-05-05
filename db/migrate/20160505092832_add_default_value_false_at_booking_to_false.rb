class AddDefaultValueFalseAtBookingToFalse < ActiveRecord::Migration
  def up
    change_column :bookings, :cleaned, :boolean, default: false
  end

  def down
    change_column :bookings, :cleaned, :boolean
  end
end
