class CreateJoinTableProductsProposals < ActiveRecord::Migration
  def change
    create_join_table :products, :proposals do |t|
      t.index :product_id
      t.index :proposal_id
    end
  end
end
