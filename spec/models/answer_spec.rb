# frozen_string_literal: true

# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  answer      :string
#  likes       :integer
#  rating      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint           not null
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#
require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject(:answer) { described_class.new }

  it { is_expected.to belong_to(:question) }

  it 'is cannot have a NULL Answer field' do
    answer.answer = nil
    answer.likes = 0
    answer.rating = 0
    expect(answer).not_to be_valid
  end

  it "is cannot have a NULL 'Likes' field" do
    answer.answer = Faker::Hipster.sentences.sample
    answer.likes = nil
    answer.rating = 0
    expect(answer).not_to be_valid
  end

  it "is cannot have a NULL 'Rating' field" do
    answer.answer = Faker::Hipster.sentences.sample
    answer.likes =  0
    answer.rating = nil
    expect(answer).not_to be_valid
  end

  it "is cannot have a Negative 'Likes' field" do
    answer.answer = Faker::Hipster.sentences.sample
    answer.likes = -1
    answer.rating = 0
    expect(answer).not_to be_valid
  end

  it "is cannot have a Negative 'Rating' field" do
    answer.answer = Faker::Hipster.sentences.sample
    answer.likes =  0
    answer.rating = -1
    expect(answer).not_to be_valid
  end

  it 'is cannot have a NULL Question_id field' do
    answer.answer = Faker::Hipster.sentences.sample
    answer.likes = 0
    answer.rating = 0
    answer.question_id = nil
    expect(answer).not_to be_valid
  end
end

# In order to be a valid Answer, it should have a question_id
describe Answer do
  subject(:answer) { @answer }

  before do
    @question = FactoryBot.build(:question)
    @answer = FactoryBot.build(:answer)
    @answer.question = @question
  end

  it 'is a valid answer' do
    expect(answer).to be_valid
  end
end
