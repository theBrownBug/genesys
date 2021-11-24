# == Schema Information
#
# Table name: reviews
#
#  id         :bigint           not null, primary key
#  body       :string
#  is_live    :boolean
#  likes      :integer
#  rating     :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :review do
    title { "MyString" }
    body { "MyString" }
    rating { 1 }
    likes { 1 }
    dislikes { 1 }
    is_live { false }
  end
end
