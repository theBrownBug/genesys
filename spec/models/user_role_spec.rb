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
require 'rails_helper'

RSpec.describe UserRole, type: :model do
  subject(:role) { described_class.new(role_id: 1, user_id: 1) }

  before { role.save }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:role) }

  it 'role_id should be present' do
    role.role_id = nil
    expect(role).not_to be_valid
  end

  it 'user_id should be present' do
    role.user_id = nil
    expect(role).not_to be_valid
  end
end
