# frozen_string_literal: true

# == Schema Information
#
# Table name: registers
#
#  id         :bigint           not null, primary key
#  country    :string
#  email      :string
#  option     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Register, type: :model do
  subject do
    described_class.new(email: 'Email',
                        option: 1)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an option chosen' do
    subject.option = nil
    expect(subject).not_to be_valid
  end
end
