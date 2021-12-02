# frozen_string_literal: true

require 'rails_helper'
describe 'Adding register' do
  specify 'I can add a register' do
    visit '/'
    click_link "I'm interested!"
    fill_in 'Email', with: 'anExample@example'
    choose('Option 1')
    click_button 'Register Interest'
    expect(page).to have_content 'anExample@example'
    # expect(page).to have_content 'Option You Choose: 2'
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
describe 'Editing register' do
  specify 'I can edit a register - option 2 to 1' do
    #FactoryBot.create(:register)
    #FactoryBot.create(:register, option: 2)
    #visit '/register/edit'
    visit '/'
    click_link "I'm interested!"
    fill_in 'Email', with: 'anExample@example'
    choose('Option 2')
    click_button 'Register Interest'
    expect(page).to have_content 'Option You Choose: 2'
    click_on 'Edit'
    choose('Option 1')
    click_button 'Register Interest'
    expect(page).to have_content 'Option You Choose: 1'
  end
  specify 'I can edit a register - option 2 to 1' do
    #FactoryBot.create(:register)
    #FactoryBot.create(:register, option: 1)
    register = FactoryBot.create(:register, option: 1)
    visit edit_register_path(register)
    choose('Option 2')
    click_button 'Register Interest'
    expect(page).to have_content 'Option You Choose: 2'
  end
  specify 'I can edit a register - change email' do
    #FactoryBot.create(:register)
    #FactoryBot.create(:register, option: 1)
    register = FactoryBot.create(:register)
    visit edit_register_path(register)
    fill_in 'Email', with: 'changedemail@example'
    click_button 'Register Interest'
    expect(page).to have_content 'changedemail@example'
  end

end
describe 'Show all register' do
  specify 'I can see mulitple registers' do
    #FactoryBot.create(:register)
    #FactoryBot.create(:register, option: 1)
    register = FactoryBot.create(:register, email: 'email@example')
    register2 = FactoryBot.create(:register, email: 'email2@example')
    visit '/registers/'
    expect(page).to have_content 'email@example'
    expect(page).to have_content 'email2@example'
  end
  specify 'I can see new registers' do
    #FactoryBot.create(:register)
    #FactoryBot.create(:register, option: 1)
    register = FactoryBot.create(:register)
    visit '/registers/'
    register2 = FactoryBot.create(:register, email: 'newer@example')
    visit '/registers/'
    expect(page).to have_content 'newer@example'
  end
end
# describe 'Deleting register', js: true do
#   specify 'I can delete a registers' do
#     #FactoryBot.create(:register)
#     #FactoryBot.create(:register, option: 1)
#     register = FactoryBot.create(:register, email: 'email3@example')
#     register2 = FactoryBot.create(:register, email: 'email4@example')
#     visit '/registers'
#     click_on 'Destroy'
#     #page.accept_alert
#     #expect(page).to have_content 'Are you sure?'
#     page.accept_confirm do
#       click_link 'Destroy'
#     end
#     expect(page).to_not have_content 'email3@example'
#   end
# end