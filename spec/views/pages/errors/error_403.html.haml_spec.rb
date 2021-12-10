# frozen_string_literal: true

require 'rails_helper'

describe 'errors/error_403' do
  describe '403' do
    it 'displays the title' do
      render
      expect(rendered).to have_selector('h1', text: 'Access Denied', visible: :all)
    end

    it 'displays the first paragraph' do
      render
      expect(rendered).to have_selector('p', text: 'The requested page is not available to you. Please check and try again.', visible: :all)
    end
  end
end
