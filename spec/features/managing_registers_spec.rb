require 'rails_helper'
    describe 'Adding register' do
        specify 'I can add a product' do
        visit '/'
        click_link 'Register Interest'
        fill_in 'Email', with: 'anExample@example'
        choose('Option 1')
        click_button 'Register Interest'
        expect(page).to have_content 'anExample@example'
        #within(:css, 'table') { expect(page).to have_content 'Kenwood - 500 watt' }

    end
end
