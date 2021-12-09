# frozen_string_literal: true

# == Schema Information
#
# Table name: user_roles
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_user_roles_on_role_id  (role_id)
#  index_user_roles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (role_id => roles.id)
#  fk_rails_...  (user_id => users.id)
#
class UserRole < ApplicationRecord
  belongs_to :user
  belongs_to :role

<<<<<<< HEAD
  validates :role_id, presence: true
  validates :user_id, presence: true
=======
  #validates :role_id , presence:true
  #validates :user_id , presence:true
>>>>>>> master
  # the combination of role_id and user_id should be always unique
  validates :role_id, uniqueness: { scope: :user_id }
end
