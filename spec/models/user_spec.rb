# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  first_name :string
#  last_name  :string
#  password   :string
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
