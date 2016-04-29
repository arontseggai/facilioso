class CreateReviewCleanings < ActiveRecord::Migration
  def change
    create_table :review_cleanings do |t|
      t.integer :rating
      t.string :comment
      t.references :cleaning_invoice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
