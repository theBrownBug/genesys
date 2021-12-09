require 'rails_helper'

describe 'Submit a question' do
  specify 'I can add a question as a Guest do' do
    visit '/questions'
    click_link "Submit a Question"
    fill_in 'question_question', with: 'Submit a question as a test'
    click_button 'Create Question'
    expect(page).to have_content 'Your question has been successfully submitted. We will update the FAQs soon.'
  end
end
