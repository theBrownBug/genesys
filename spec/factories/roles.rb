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
FactoryBot.define do
  factory :role do
    factory :admin_role do
      role_type { 1 }
    end
    factory :product_owner_role do
      role_type { 2 }
    end
    factory :reporter_role do
      role_type { 3 }
    end
  end
end
