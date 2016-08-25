class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :reviwer_id
      t.string :reviewable_type
      t.integer :reviewable_id
      t.integer :stars, null: false
      t.string :headline, null: false
      t.text :content, null: false
      t.timestamps null: false

    end
  end
end
