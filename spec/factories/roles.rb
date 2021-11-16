# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  is_active  :boolean
#  is_current :boolean
#  role_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_roles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :role do
    role_type { 1 }
    is_active { false }
    is_current { false }
  end
end
