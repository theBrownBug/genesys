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
require 'rails_helper'

RSpec.describe Register, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
