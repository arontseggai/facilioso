class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :street
      t.string :area_code
      t.string :house_number
      t.string :city
      t.string :hotline
      t.boolean :active
      t.string :airbnb_link
      t.boolean :contract
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
