class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :proposal
      t.references :product_id
      t.integer :quantity
      t.decimal :discount
      t.string :notes

      t.timestamps null: false
    end

  end
end
