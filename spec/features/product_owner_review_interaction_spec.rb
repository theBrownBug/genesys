# frozen_string_literal: true

require 'rails_helper'

describe 'Product owner review table interaction' do
  before do
    user = FactoryBot.create :product_owner_user
    login_as(user)

    visit '/reviews'
  end

  specify 'View table' do
    expect(page).to have_css('table.table.table-striped.align-middle')
    expect(page).to have_css('th', count: 8)
  end

  specify 'View table headers' do
    expect(page).to have_content('#')
    expect(page).to have_content('Title')
    expect(page).to have_content('Body')
    expect(page).to have_content('Rating')
    expect(page).to have_content('Likes')
    expect(page).to have_content('Is live')
    expect(page).to have_content('Is live on landing')
    expect(page).to have_content('Edit')
  end
end

describe 'Product owner review table content interaction' do
  let!(:review) { FactoryBot.create :review }

  before do
    user = FactoryBot.create :product_owner_user
    login_as(user)

    visit '/reviews'
  end

  specify 'view review contents in table' do
    expect(page).to have_content('1', count: 2)
    expect(page).to have_content('Lorem ipsum')
    expect(page).to have_content('Lorem ipsum body.')
  end

  specify 'view offline badge, when is_live is false' do
    review.is_live = false
    review.save

    visit current_path

    expect(page).to have_css('span.badge.rounded-pill.bg-secondary')
    expect(page).to have_content('Offline')
  end

  specify 'view offline badge, when is_live_landing is false' do
    review.is_live = false
    review.is_live_landing = false
    review.save

    visit current_path

    expect(page).to have_css('span.badge.rounded-pill.bg-secondary')
    expect(page).to have_content('Offline')
  end

  specify 'view live badge, when is_live is true' do
    review.is_live = true
    review.save

    visit current_path

    expect(page).to have_css('span.badge.rounded-pill.bg-danger')
    expect(page).to have_content('Live')
  end

  specify 'view live badge, when is_live_landing is true' do
    review.is_live = false
    review.is_live_landing = true
    review.save

    visit current_path

    expect(page).to have_css('span.badge.rounded-pill.bg-danger')
    expect(page).to have_content('Live')
  end
end
