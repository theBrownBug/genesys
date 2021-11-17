# == Schema Information
#
# Table name: registers
#
#  id         :bigint           not null, primary key
#  email      :string
#  poption    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Register < ApplicationRecord
end
