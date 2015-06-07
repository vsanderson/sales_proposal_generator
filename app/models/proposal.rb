# == Schema Information
#
# Table name: proposals
#
#  id          :integer          not null, primary key
#  name        :string
#  customer_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Proposal < ActiveRecord::Base
  belongs_to :customer
  belongs_to :user
  has_many :line_items
  has_many :products, through: :line_items
  accepts_nested_attributes_for :line_items, allow_destroy: true

  delegate :name, to: :customer, prefix: true

end
