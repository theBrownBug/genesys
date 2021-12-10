# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ReviewsHelper. For example:
#
# describe ReviewsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ReviewsHelper, type: :helper do
  describe '#ratings_metrics' do
    let(:ratings) { { 5 => 1, 4 => 1, 3 => 1, 2 => 1, 1 => 1 } }
    let(:reviews_count) { 5 }
    let(:average) { 3 }

    it 'creates a hash containing average' do
      expect(helper.ratings_metrics(ratings, reviews_count)).to have_key(:average)
    end

    it 'creates a hash containing average of 3' do
      result = helper.ratings_metrics(ratings, reviews_count)

      expect(result[:average]).to eq average
    end
  end

  describe '#rating_metrics' do
    let(:count) { 5 }
    let(:reviews_count) { 10 }
    let(:dummy_class) { Class.new { extend ReviewsHelper } }

    it 'creates a hash of rating count, overall rating percentage, and rating color for rating 1' do
      rating = 1

      expected_response = { count: count, rating_percentage: 50, color: RATING_COLOR[rating] }
      response = dummy_class.send(:rating_metrics, rating, count, reviews_count)

      expect(response).to eq expected_response
    end

    it 'creates a hash of rating count, overall rating percentage, and rating color for rating 2' do
      rating = 2

      expected_response = { count: count, rating_percentage: 50, color: RATING_COLOR[rating] }
      response = dummy_class.send(:rating_metrics, rating, count, reviews_count)

      expect(response).to eq expected_response
    end

    it 'creates a hash of rating count, overall rating percentage, and rating color for rating 3' do
      rating = 3

      expected_response = { count: count, rating_percentage: 50, color: RATING_COLOR[rating] }
      response = dummy_class.send(:rating_metrics, rating, count, reviews_count)

      expect(response).to eq expected_response
    end

    it 'creates a hash of rating count, overall rating percentage, and rating color for rating 4' do
      rating = 4

      expected_response = { count: count, rating_percentage: 50, color: RATING_COLOR[rating] }
      response = dummy_class.send(:rating_metrics, rating, count, reviews_count)

      expect(response).to eq expected_response
    end

    it 'creates a hash of rating count, overall rating percentage, and rating color for rating 5' do
      rating = 5

      expected_response = { count: count, rating_percentage: 50, color: RATING_COLOR[rating] }
      response = dummy_class.send(:rating_metrics, rating, count, reviews_count)

      expect(response).to eq expected_response
    end
  end
end
