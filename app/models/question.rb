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
  has_many :answer, dependent: :destroy
  validates :popularity, numericality: { greater_than: 0}
  before_save :set_default_values

  def set_default_values
    self.likes ||= 0
    self.popularity ||= 0
  end

end
