# frozen_string_literal: true

# == Schema Information
#
# Table name: user_roles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_roles_on_role_id  (role_id)
#  index_user_roles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :user_role do
    '''
    factory :admin_user_role_entry do
      factory :admin_user
      factory :admin_role
    end

    factory :product_owner_user_role_entry do
      factory :product_owner_user
      factory :product_role
    end

    factory :reporter_user_role_entry do
      factory :reporter_user
      factory :reporter_role
    end
  '''
  end
end
