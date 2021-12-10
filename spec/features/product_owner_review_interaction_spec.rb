require 'rails_helper'

describe 'Product owner review interaction' do
  # let(:user) = FactoryBot.create :product_owner

  specify 'View reviews' do
    FactoryBot.create :review
    visit '/review'
  end
end