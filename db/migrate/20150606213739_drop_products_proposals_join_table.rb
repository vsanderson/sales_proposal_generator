class DropProductsProposalsJoinTable < ActiveRecord::Migration
  def change
    drop_join_table :products, :proposals do |t|
      t.index :product_id
      t.index :proposal_id
    end
  end
end
