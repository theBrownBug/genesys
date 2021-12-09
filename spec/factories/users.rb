# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  user_type              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    factory :admin_user do
      first_name { 'admin' }
      last_name { 'admin' }
      email { 'admin@admin.com' }
      password { 'Passsword_1' }
      user_type { 0 }

      after(:build)  do |user|
        user.roles << FactoryBot.build(:admin_role)
      end
    end

    factory :product_owner_user do
      first_name { 'product_owner' }
      last_name { 'product_owner' }
      email { 'po@po.com' }
      password { 'Passsword_1' }
      user_type { 0 }

      after(:build)  do |user|
        user.roles << FactoryBot.build(:product_owner_role)
      end

    end

    factory :reporter_user do
      first_name { 'reporter' }
      last_name { 'reporter' }
      email { 'reporter@reporter.com' }
      password { 'Passsword_1' }
      user_type { 0 }
      after(:build) do |user|
        user.roles << FactoryBot.build(:reporter_role)
      end
    end








  end
end
