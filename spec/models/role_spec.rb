# frozen_string_literal: true

# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  role_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Role, type: :model do
  # association tests
  subject { described_class.new }

  it { is_expected.to have_many(:users).through(:user_roles) }
  it { is_expected.to have_many(:user_roles) }

  it 'cannot have empty(NULL) Role Type' do
    subject.role_type = nil
    expect(subject).not_to be_valid
  end
end

# test uniqueness of a role enum and ignore_case
describe Role do
  subject { @role }

  before do
    @role = FactoryBot.build(:role)
  end

  it { is_expected.to validate_uniqueness_of(:role_type).ignoring_case_sensitivity }
end
