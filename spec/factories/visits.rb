# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  from       :datetime
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  to         :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :visit do
    from { "" }
    to { "" }
    longitude { "9.99" }
    latitude { "9.99" }
  end
end
