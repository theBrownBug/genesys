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
  subject(:register) do
    described_class.new(email: 'Email',
                        option: 1)
  end

  it 'is valid with valid attributes' do
    expect(register).to be_valid
  end

  it 'is not valid without an email' do
    register.email = nil
    expect(register).not_to be_valid
  end

  it 'is not valid without an option chosen' do
    register.option = nil
    expect(register).not_to be_valid
  end
end
