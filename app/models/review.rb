# frozen_string_literal: true

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
class Review < ApplicationRecord

  validates :rating, :title, :body, presence: true
  validates :rating, numericality: { greater_than: 0, less_than: 6 }

  before_save :set_default_values

  private

  def set_default_values
    self.likes ||= 0
  end

end
