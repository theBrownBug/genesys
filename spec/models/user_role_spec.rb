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
  subject { described_class.new(role_id: 1, user_id: 1) }

  before { subject.save }

  it { should belong_to(:user) }
  it {should belong_to(:role)  }

  it 'role_id should be present' do
    subject.role_id = nil
    expect(subject).not_to be_valid
  end

  it 'user_id should be present' do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end
end
