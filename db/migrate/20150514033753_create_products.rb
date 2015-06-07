class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :supplier, index: true, foreign_key: true
      t.integer :asi_number
      t.string :item_number
      t.integer :page_number
      t.decimal :price

      t.timestamps null: false
    end
  end
end
