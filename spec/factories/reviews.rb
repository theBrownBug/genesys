# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  body            :string
#  is_live         :boolean
#  is_live_landing :boolean
#  likes           :integer
#  rating          :integer
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :review do
    title { 'Lorem Ipsum' }
    body { 'Lorem ipsum body.' }
    rating { 1 }
    likes { 1 }
    is_live { true }
    is_live_landing { true }
  end
end
