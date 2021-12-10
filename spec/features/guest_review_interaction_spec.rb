require 'rails_helper'

describe 'Guest review interaction' do
  specify 'Submit a review' do
    review_new = Review.new(title: "title", body: "body", rating: 5)
    review_new.save

    visit '/reviews'
    first('input#rating', visible: false).set("5")
    fill_in 'title', with: 'Title'
    fill_in 'body', with: 'Body'
    click_button 'Create Review'

    expect(page).to have_content 'Thank you - your review was successfully created! '
  end

  # specify 'Increase like count when review is liked' do
  #   FactoryBot.create :review
  #
  #   visit '/reviews'
  #
  #   like_button = find('#like_1')
  #
  #   like_button.click
  #
  #   expect(page).to have_content '2 people found this review helpful', wait: 10
  #
  #   # expect(like_button).to have_css(".fas")
  # end
end