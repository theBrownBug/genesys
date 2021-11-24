# frozen_string_literal: true

require 'rails_helper'

describe 'pages/home' do
  describe '#landing_splash' do
    it 'displays the tagline' do
      render
      expect(rendered).to have_selector('h1', text: 'Stay organised with university work every single week.')
    end

    it 'displays the first paragraph' do
      render
      expect(rendered).to have_selector('p', text: "It's often difficult to keep up with a course when you only have a few hours of lectures a week and no day-to-day structure.")
    end

    it 'displays the second paragraph' do
      render
      expect(rendered).to have_selector('p', text: 'This can leave you feeling unmotivated and eventually lead to falling behind on work.')
    end

    it 'displays the start of the third paragraph' do
      render
      expect(rendered).to have_selector('p', text: 'Our application solves this problem by allowing')
    end

    it 'displays the bold text' do
      render
      expect(rendered).to have_selector('strong', text: 'automated management of your time')
    end

    it 'displays the end of the third paragraph' do
      render
      expect(rendered).to have_selector('p', text: 'based on the credit weights of your modules, allowing you to focus on the actual studying.')
    end
  end

  describe '#landing_features' do
    it 'displays the title' do
      render
      expect(rendered).to have_selector('h2', text: 'A timetable to suit you')
    end

    it 'displays the subtitle' do
      render
      expect(rendered).to have_selector('p', text: 'Feature spotlight')
    end

    # rubocop:disable Rspec/MultipleExpectations
    it 'displays the feature titles' do
      render
      expect(rendered).to have_selector('h6', text: 'Automated timetable creation')
      expect(rendered).to have_selector('h6', text: 'Account for last minute changes')
      expect(rendered).to have_selector('h6', text: 'Track repeating tasks')
      expect(rendered).to have_selector('h6', text: 'Interested?')
    end
    # rubocop:enable Rspec/MultipleExpectations
  end
end
