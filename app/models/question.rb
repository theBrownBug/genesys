# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  is_live    :boolean
#  popularity :integer
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Question < ApplicationRecord
  has_one :answer
  validates :question, presence: true
  validates :popularity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :is_live, inclusion: [false], if: ->(question) { question.answer.blank? }

  def get_answer
    answer = Answer.find_by(question_id: id)
    return nil if answer.nil?

    answer = answer.answer
  end
end
