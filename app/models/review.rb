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
end
