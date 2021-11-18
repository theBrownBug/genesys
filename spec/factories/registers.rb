# == Schema Information
#
# Table name: registers
#
#  id         :bigint           not null, primary key
#  email      :string
<<<<<<< HEAD
#  option     :integer
=======
#  poption    :integer
>>>>>>> 8a7fbcf0f8dc4b4988c3bfaf22d5043044cb5a6e
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :register do
    email { "MyString" }
<<<<<<< HEAD
    option { 1 }
=======
    poption { 1 }
>>>>>>> 8a7fbcf0f8dc4b4988c3bfaf22d5043044cb5a6e
  end
end
