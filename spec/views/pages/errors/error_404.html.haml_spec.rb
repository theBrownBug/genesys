# frozen_string_literal: true

require 'rails_helper'

describe 'errors/error_404' do
  describe '404' do
    it 'displays the title' do
      render
      expect(rendered).to have_selector('h1', text: 'Not Found', visible: :all)
    end

    it 'displays the first paragraph' do
      render
      expect(rendered).to have_selector('p', text: "The requested page could not be found. Please check the address and try again. If you are unsure you may", visible: :all)
    end
  end
end
