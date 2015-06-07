# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password

  has_many :customers
  has_many :proposals
  accepts_nested_attributes_for :proposals

  validates :email, uniqueness: true
  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  def guest?
    false
  end

end
