# frozen_string_literal: true

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
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :role_type, uniqueness: true , presence: true
  validates_uniqueness_of :role_type, :case_sensitive => false
  enum role_type: { normal: 0, admin: 1, product_owner: 2, reporter: 3 }
end
