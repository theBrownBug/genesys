# frozen_string_literal: true

# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  country    :string
#  from       :datetime
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#  path       :string
#  to         :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :string
#
require 'rails_helper'

RSpec.describe Visit, type: :model do
  subject do
    described_class.new(country: 'United Kingdom',
                        from: DateTime.now,
                        latitude: 2.456,
                        longitude: 52.452,
                        path: '/',
                        to: DateTime.now)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without path' do
    subject.path = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without from' do
    subject.from = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without to' do
    subject.to = nil
    expect(subject).not_to be_valid
  end

  it 'is valid without longitude' do
    subject.longitude = nil
    expect(subject).to be_valid
  end

  it 'is valid without latitude' do
    subject.latitude = nil
    expect(subject).to be_valid
  end

  it 'is valid without country' do
    subject.country = nil
    expect(subject).to be_valid
  end

  it 'is not valid with latitude greater than 90' do
    subject.latitude = 100
    expect(subject).not_to be_valid
  end

  it 'is not valid with latitude less than -90' do
    subject.latitude = -100
    expect(subject).not_to be_valid
  end

  it 'is not valid with longitude greater than 180' do
    subject.longitude = 190
    expect(subject).not_to be_valid
  end

  it 'is not valid with longitude less than -90' do
    subject.longitude = -190
    expect(subject).not_to be_valid
  end
end
