# frozen_string_literal: true

require 'rails_helper'

describe 'errors/error_422' do
  describe '422' do
    it 'displays the title' do
      render
      expect(rendered).to have_selector('h1', text: 'Change Rejected', visible: :all)
    end

    it 'displays the first paragraph' do
      render
      expect(rendered).to have_selector('p', text: "Maybe you tried to change something you didn't have access to.", visible: :all)
    end
  end
end
