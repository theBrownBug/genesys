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


  def get_answer
    answer = Answer.find_by(question_id: self.id)
    if answer.nil?
      return nil
    end
    answer = answer.answer
  end

end
