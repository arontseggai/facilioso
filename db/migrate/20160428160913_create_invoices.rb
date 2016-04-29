class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :month
      t.boolean :paid
      t.integer :amount
      t.integer :fee
      t.integer :extra_fee
      t.integer :tax
      t.integer :total_amount
      t.string :notes
      t.references :user, index: true, foreign_key: true
      t.references :cleaning_invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
