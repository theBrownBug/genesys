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
  it { should have_many(:users).through(:user_roles)}
  it {should have_many(:user_roles)}
  subject {described_class.new}
  it "cannot have empty(NULL) Role Type" do
    subject.role_type = nil
    expect(subject).not_to be_valid
  end
end

# test uniqueness of a role enum and ignore_case
describe Role do
  before do
    @role = FactoryBot.build(:role)
  end

  subject { @role }
  it { should validate_uniqueness_of(:role_type).ignoring_case_sensitivity  }
end
