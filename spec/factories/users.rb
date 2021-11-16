# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
FactoryBot.define do
  factory :user do
    user_id { "" }
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    password { "MyString" }
  end
end
