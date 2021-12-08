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
  reverse_geocoded_by :latitude, :longitude do |obj, results|
    obj.country = geo.country if geo == results.first
  end
  after_validation :reverse_geocode
  def coords
    [latitude, longitude]
  end
end
