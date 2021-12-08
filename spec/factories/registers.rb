# frozen_string_literal: true

# == Schema Information
#
# Table name: registers
#
#  id         :bigint           not null, primary key
#  email      :string
#  option     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :register do
    sequence(:email) { |i| "example#{i}@example.com" }
    option { 1 }
  end
end
