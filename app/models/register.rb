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
class Register < ApplicationRecord
    validates :email, presence: true
    validates :option, presence: true
end
