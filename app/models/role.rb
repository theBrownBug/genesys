# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  role_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Role < ApplicationRecord
  has_many :user_roles
  has_many :users , through: :user_roles

  enum role_type: [:normal, :admin ,:product_owner, :reporter]
end
