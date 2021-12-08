# frozen_string_literal: true

# == Schema Information
#
# Table name: clicks
#
#  id         :bigint           not null, primary key
#  category   :string
#  path       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :string
#
class Click < ApplicationRecord
end
