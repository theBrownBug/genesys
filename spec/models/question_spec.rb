# frozen_string_literal: true

# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  is_live    :boolean
#  popularity :integer
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Question, type: :model do
  # association tests
  subject { described_class.new }

  it { is_expected.to have_one(:answer) }

  it 'is cannot have a NULL question field' do
    subject.question = nil
    subject.popularity = 0
    subject.is_live = false
    expect(subject).not_to be_valid
  end

  it 'is cannot have a NULL Popularity field' do
    subject.question = Faker::Hipster.sentences.sample
    subject.popularity = nil
    subject.is_live = false
    expect(subject).not_to be_valid
  end

  it "is cannot have a NULL 'is_live' field" do
    subject.question = Faker::Hipster.sentences.sample
    subject.popularity = 0
    subject.is_live = nil
    expect(subject).not_to be_valid
  end

  it 'is cannot have a NEGATIVE popularity field' do
    subject.question = Faker::Hipster.sentences.sample
    subject.popularity = -1
    subject.is_live = false
    expect(subject).not_to be_valid
  end

  it 'is is a valid sample question' do
    subject.question = Faker::Hipster.sentences.sample
    subject.popularity = 0
    subject.is_live = false
    expect(subject).to be_valid
  end
end

describe Question do
  subject { @question }

  before do
    @question = FactoryBot.build(:question)
    @answer = FactoryBot.build(:answer)
  end

  it 'Question cannot be set to Live until it has an Answer' do
    subject.answer = nil
    subject.is_live = true
    expect(subject).not_to be_valid
  end

  it 'Question can be set to Live if it has an Associated answer' do
    subject.answer = @answer
    subject.is_live = true
    expect(subject).to be_valid
  end
end
