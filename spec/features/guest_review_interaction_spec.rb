require 'rails_helper'

describe 'Guest review interaction' do
  let(:review) { FactoryBot.create :review }

  specify 'Submit a review' do
    review.is_live = true
    review.save

    visit '/reviews'
    first('input#rating', visible: false).set("5")
    fill_in 'title', with: 'Title'
    fill_in 'body', with: 'Body'
    click_button 'Create Review'

    expect(page).to have_content 'Thank you - your review was successfully created! '
  end

  specify 'See a review' do
    review.is_live = true
    review.save

    visit '/reviews'

    expect(page).to have_css('.card')
    expect(page).to have_content('Lorem Ipsum')
    expect(page).to have_content('Lorem ipsum body.')
    expect(page).to have_content('1 people found this review helpful')
  end
end