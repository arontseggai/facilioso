class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :check_in
      t.datetime :check_out
      t.date :expected_arrival
      t.date :expected_departure
      t.string :notes
      t.boolean :cleaned
      t.integer :amount
      t.integer :state
      t.references :apartment, index: true, foreign_key: true
      t.references :invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
