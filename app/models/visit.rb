# frozen_string_literal: true

# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  country    :string
#  from       :datetime
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  path       :string
#  to         :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Visit < ApplicationRecord
  def coords
    [latitude, longitude]
  end
end
