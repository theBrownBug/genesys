# frozen_string_literal: true

require 'rails_helper'
describe 'Adding register' do
  specify 'I can add a register' do
    # register = FactoryBot.create(:register)
    visit '/'
    click_link "I'm interested!"
    fill_in 'Email', with: 'anExamplethatisunique@example'
    choose('Option 1')
    click_button 'Register Interest'
    expect(page).to have_content 'Register was successfully created'
    # expect(page).to have_content 'Option You Choose: 2'
  end

  specify 'I can add a register - option 2' do
    # register = FactoryBot.create(:register)
    visit '/'
    click_link "I'm interested!"
    fill_in 'Email', with: 'anExamplethatisunique2@example'
    choose('Option 2')
    click_button 'Register Interest'
    expect(page).to have_content 'Register was successfully created'
  end
end
