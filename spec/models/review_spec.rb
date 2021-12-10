# frozen_string_literal: true

# == Schema Information
#
# Table name: reviews
#
#  id              :bigint           not null, primary key
#  body            :string
#  is_live         :boolean
#  is_live_landing :boolean
#  likes           :integer
#  rating          :integer
#  title           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
