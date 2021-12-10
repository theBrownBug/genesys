# frozen_string_literal: true

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
class Answer < ApplicationRecord
  belongs_to :question
  validates :answer, presence: true
  validates :likes , presence:true , numericality: {greater_than_or_equal_to:  0 }
  validates :rating, presence:true , numericality: {greater_than_or_equal_to:  0 }

end
