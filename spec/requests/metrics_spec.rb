# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'Metrics', type: :request do
  let(:valid_visit) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  it 'renders index' do
    get metrics_url
    expect(response).to be_successful
  end

  it 'registers a new click' do
    post '/click', params: { session_id: '124', path: '/test', category: '2', value: '1' }
    expect(response).to be_successful
  end

  it 'registers visit without latitude' do
    post metrics_url, params: { session_id: '124', path: '/test', longitude: 2 }
    expect(response).to be_successful
  end

  it 'registers visit without longitude' do
    post metrics_url, params: { session_id: '124', path: '/test', latitude: 2 }
    expect(response).to be_successful
  end
end
