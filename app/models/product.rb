# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  supplier_id :integer
#  asi_number  :integer
#  item_number :string
#  page_number :integer
#  price       :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :proposals, through: :line_items
  has_and_belongs_to_many :line_items

  validates :name,
            :supplier_id,
            :asi_number,
            :item_number,
            :page_number,
            :price,
            presence: true
end
