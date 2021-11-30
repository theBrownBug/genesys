# frozen_string_literal: true

# == Schema Information
#
# Table name: registers
#
#  id         :bigint           not null, primary key
#  country    :string
#  email      :string
#  option     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Register < ApplicationRecord
end
