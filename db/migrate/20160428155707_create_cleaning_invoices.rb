class CreateCleaningInvoices < ActiveRecord::Migration
  def change
    create_table :cleaning_invoices do |t|
      t.integer :amount
      t.integer :rate
      t.integer :tax
      t.integer :total
      t.time :cleaning_time
      t.boolean :paid

      t.timestamps null: false
    end
  end
end
