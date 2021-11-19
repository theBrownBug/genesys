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
require 'rails_helper'

RSpec.describe Visit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
