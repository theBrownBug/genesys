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
class Role < ApplicationRecord
  belongs_to :user
  enum role_type: [:normal, :admin ,:product_owner, :reporter]

end
