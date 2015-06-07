# == Schema Information
#
# Table name: line_items
#
#  id          :integer          not null, primary key
#  proposal_id :integer
#  product_id  :integer
#  quantity    :integer
#  discount    :decimal(, )
#  notes       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LineItem < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :product

  validates :quantity, numericality: { greater_than: 0 }

  def price
    product.price * quantity
  end

  def line_price
    discount.present? ? price * discount : price
  end

end
