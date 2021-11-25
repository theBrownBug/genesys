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
    role_type { 1 }
  end
end
