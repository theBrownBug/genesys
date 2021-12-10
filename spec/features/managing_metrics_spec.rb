# frozen_string_literal: true

require 'rails_helper'
describe 'Adding register' do
  specify 'I can view all cards' do
    visit '/metrics'
    expect(page).to have_content 'Sessions'
    expect(page).to have_content 'Registrations'
    expect(page).to have_content 'Session Location'
    expect(page).to have_content 'Registration Location'
    expect(page).to have_content 'Pricing Options'
    expect(page).to have_content 'Feature Clicks'
    expect(page).to have_content 'Feature Shares'
    expect(page).to have_content 'Most Popular Reviews'
    expect(page).to have_content 'FAQ Clicks'
  end
end
