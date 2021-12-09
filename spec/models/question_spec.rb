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
  it { should have_one(:answer)}
  it "is cannot have a NULL question field" do
    subject.question = nil
    subject.popularity = 0
    subject.is_live = false
    expect(subject).not_to be_valid
  end

  it "is cannot have a NULL Popularity field" do
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

  it "is cannot have a NEGATIVE popularity field" do
    subject.question = Faker::Hipster.sentences.sample
    subject.popularity = -1
    subject.is_live = false
    expect(subject).not_to be_valid
  end

end
