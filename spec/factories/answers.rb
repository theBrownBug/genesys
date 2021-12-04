# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  answer      :string
#  likes       :integer
#  rating      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
FactoryBot.define do
  factory :answer do
    answer { "MyString" }
    rating { 1 }
    likes { 1 }
    question { nil }
  end
end
