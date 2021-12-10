# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string
#  user_type              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { described_class.new }

  # test email - Invalid
  it 'is with invalid email' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email.com'
    user.password = 'Password_1'
    user.user_type = 0
    expect(user).not_to be_valid
  end

  it 'cannot have A NULL email' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = nil
    user.password = 'Password_1'
    user.user_type = 1
    expect(user).not_to be_valid
  end

  # test email - valid
  it 'is with Valid email' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'Password_1'
    user.user_type = 0
    expect(user).to be_valid
  end

  # test user_type - Valid
  it 'is an internal user' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'Password_1'
    user.user_type = 0
    expect(user).to be_internal
  end

  it 'is an external user' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'Password_1'
    user.user_type = 1
    expect(user).to be_external
  end
  # test user_type - Invalid

  it 'has NULL user_type' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'Password_1'
    user.user_type = nil
    expect(user).not_to be_valid
  end

  # test passwords - Invalid
  it 'has an invalid password with no uppercase characters' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'password_1'
    user.user_type = 1
    expect(user).not_to be_valid
  end

  it 'has an invalid password with no lowercase characters' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'PASSWORD_1'
    user.user_type = 1
    expect(user).not_to be_valid
  end

  it 'has an invalid password with no special characters' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'Password1'
    user.user_type = 1
    expect(user).not_to be_valid
  end

  it 'has an invalid password with no numbers' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'Password_'
    user.user_type = 1
    expect(user).not_to be_valid
  end

  it 'has an invalid password with less than 8 characters' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'Pass_1'
    user.user_type = 1
    expect(user).not_to be_valid
  end

  # test passwords - valid
  it 'has an VALID password' do
    user.first_name = 'Anything'
    user.last_name = 'Anything'
    user.email = 'email@email.com'
    user.password = 'Password_1'
    user.user_type = 1
    expect(user).to be_valid
  end

  # test associations
  it 'has many Roles' do
    t = described_class.reflect_on_association(:roles)
    expect(t.macro).to eq(:has_many)
  end

  it 'has many User Roles' do
    t = described_class.reflect_on_association(:user_roles)
    expect(t.macro).to eq(:has_many)
  end
end
