# frozen_string_literal: true

require 'rails_helper'
# frozen_string_literal: true

# == Schema Information
#
# Table name: clicks
#
#  id         :bigint           not null, primary key
#  category   :string
#  path       :string
#  value      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :string

RSpec.describe Click, type: :model do
  subject do
    described_class.new(category: 'FAQ',
                        path: '/',
                        value: '1452',
                        session_id: 'session_id')
  end

  it 'is valid with all appropriate fields' do
    expect(subject).to be_valid
  end

  it 'is not valid without category' do
    subject.category = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without value' do
    subject.value = nil
    expect(subject).not_to be_valid
  end
end
