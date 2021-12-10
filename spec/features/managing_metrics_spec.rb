# frozen_string_literal: true

require 'rails_helper'
describe 'Adding register' do
  specify 'I can view Sessions' do
    visit '/metrics'
    expect(page).to have_content 'Sessions'
  end

  specify 'I can view Registrations' do
    visit '/metrics'
    expect(page).to have_content 'Registrations'
  end

  specify 'I can view Session Location' do
    visit '/metrics'
    expect(page).to have_content 'Session Location'
  end

  specify 'I can view Registration Location' do
    visit '/metrics'
    expect(page).to have_content 'Registration Location'
  end

  specify 'I can view Pricing Options' do
    visit '/metrics'
    expect(page).to have_content 'Pricing Options'
  end

  specify 'I can view Feature Clicks' do
    visit '/metrics'
    expect(page).to have_content 'Feature Clicks'
  end

  specify 'I can view Feature Shares' do
    visit '/metrics'
    expect(page).to have_content 'Feature Shares'
  end

  specify 'I can view Most Popular Reviews' do
    visit '/metrics'
    expect(page).to have_content 'Most Popular Reviews'
  end

  specify 'I can view FAQ Clicks' do
    visit '/metrics'
    expect(page).to have_content 'FAQ Clicks'
  end
end
