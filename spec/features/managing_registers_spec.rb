require 'rails_helper'
describe 'Adding register' do
    specify 'I can add a register' do
        visit '/'
        click_link "I'm interested!"
        fill_in 'Email', with: 'anExample@example'
        choose('Option 1')
        click_button 'Register Interest'
        expect(page).to have_content 'anExample@example'
        #expect(page).to have_content 'Option You Choose: 2'
    end

    specify 'I can add a register - option 2' do
        visit '/'
        click_link "I'm interested!"
        fill_in 'Email', with: 'anExample@example'
        choose('Option 2')
        click_button 'Register Interest'
        expect(page).to have_content 'Option You Choose: 2'
    end
end

