# frozen_string_literal: true

# == Schema Information
#
# Table name: answers
#
#  id           :bigint           not null, primary key
#  answer       :string
#  likes        :integer
#  rating       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  questions_id :bigint           not null
#
# Indexes
#
#  index_answers_on_questions_id  (questions_id)
#
# Foreign Keys
#
#  fk_rails_...  (questions_id => questions.id)
#
class Answer < ApplicationRecord
  belongs_to :question
end
