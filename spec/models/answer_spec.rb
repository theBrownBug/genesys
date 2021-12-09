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
  it { should belong_to(:question) }
  subject {described_class.new}

  it "is cannot have a NULL Answer field" do
    subject.answer = nil
    subject.likes = 0
    subject.rating = 0
    expect(subject).not_to be_valid
  end

  it "is cannot have a NULL 'Likes' field" do
    subject.answer = Faker::Hipster.sentences.sample
    subject.likes = nil
    subject.rating = 0
    expect(subject).not_to be_valid
  end

  it "is cannot have a NULL 'Rating' field" do
    subject.answer = Faker::Hipster.sentences.sample
    subject.likes =  0
    subject.rating = nil
    expect(subject).not_to be_valid
  end


  it "is cannot have a Negative 'Likes' field" do
    subject.answer = Faker::Hipster.sentences.sample
    subject.likes = -1
    subject.rating = 0
    expect(subject).not_to be_valid
  end

  it "is cannot have a Negative 'Rating' field" do
    subject.answer = Faker::Hipster.sentences.sample
    subject.likes =  0
    subject.rating = -1
    expect(subject).not_to be_valid
  end

  it "is cannot have a NULL Question_id field" do
    subject.answer = Faker::Hipster.sentences.sample
    subject.likes = 0
    subject.rating = 0
    subject.question_id = nil
    expect(subject).not_to be_valid
  end


end
