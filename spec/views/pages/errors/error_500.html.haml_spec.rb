# frozen_string_literal: true

require 'rails_helper'

describe 'errors/error_500' do
  describe '500' do
    it 'displays the title' do
      render
      expect(rendered).to have_selector('h1', text: 'Server Error', visible: :all)
    end

    it 'displays the first paragraph' do
      render
      expect(rendered).to have_selector('p', text: 'Sorry, there was a problem, please try again.', visible: :all)
    end
  end
end
