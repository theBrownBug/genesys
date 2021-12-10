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
  subject(:question) { described_class.new }

  it { is_expected.to have_one(:answer) }

  it 'is cannot have a NULL question field' do
    question.question = nil
    question.popularity = 0
    question.is_live = false
    expect(question).not_to be_valid
  end

  it 'is cannot have a NULL Popularity field' do
    question.question = Faker::Hipster.sentences.sample
    question.popularity = nil
    question.is_live = false
    expect(question).not_to be_valid
  end

  it "is cannot have a NULL 'is_live' field" do
    question.question = Faker::Hipster.sentences.sample
    question.popularity = 0
    question.is_live = nil
    expect(question).not_to be_valid
  end

  it 'is cannot have a NEGATIVE popularity field' do
    question.question = Faker::Hipster.sentences.sample
    question.popularity = -1
    question.is_live = false
    expect(question).not_to be_valid
  end

  it 'is is a valid sample question' do
    question.question = Faker::Hipster.sentences.sample
    question.popularity = 0
    question.is_live = false
    expect(question).to be_valid
  end
end

describe Question do
  subject(:question) { @question }

  before do
    @question = FactoryBot.build(:question)
    @answer = FactoryBot.build(:answer)
  end

  it 'Question cannot be set to Live until it has an Answer' do
    question.answer = nil
    question.is_live = true
    expect(question).not_to be_valid
  end

  it 'Question can be set to Live if it has an Associated answer' do
    question.answer = @answer
    question.is_live = true
    expect(question).to be_valid
  end
end
