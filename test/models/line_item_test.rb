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

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
