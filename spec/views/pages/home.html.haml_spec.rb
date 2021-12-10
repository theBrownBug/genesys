# frozen_string_literal: true

require 'rails_helper'

describe 'pages/home' do
  describe '#landing_splash' do
    it 'displays the tagline' do
      render
      expect(rendered).to have_selector('h1', text: 'Stay organised with university work every single week.', visible: :all)
    end

    it 'displays the first paragraph' do
      render
      expect(rendered).to have_selector('p', text: "It's often difficult to keep up with a course when you only have a few hours of lectures a week and no day-to-day structure.", visible: :all)
    end

    it 'displays the second paragraph' do
      render
      expect(rendered).to have_selector('p', text: 'This can leave you feeling unmotivated and eventually lead to falling behind on work.', visible: :all)
    end

    it 'displays the start of the third paragraph' do
      render
      expect(rendered).to have_selector('p', text: 'Our application solves this problem by allowing', visible: :all)
    end

    it 'displays the bold text' do
      render
      expect(rendered).to have_selector('strong', text: 'automated management of your time', visible: :all)
    end

    it 'displays the end of the third paragraph' do
      render
      expect(rendered).to have_selector('p', text: 'based on the credit weights of your modules, allowing you to focus on the actual studying.', visible: :all)
    end
  end

  describe '#landing_features' do
    it 'displays the title' do
      render
      expect(rendered).to have_selector('h2', text: 'A timetable to suit you', visible: :all)
    end

    it 'displays the subtitle' do
      render
      expect(rendered).to have_selector('p', text: 'Feature spotlight', visible: :all)
    end

    it 'displays the feature titles' do
      render
      expect(rendered).to have_selector('h6', text: 'Automated timetable creation', visible: :all)
      expect(rendered).to have_selector('h6', text: 'Account for last minute changes', visible: :all)
      expect(rendered).to have_selector('h6', text: 'Track repeating tasks', visible: :all)
      expect(rendered).to have_selector('h6', text: 'Interested?', visible: :all)
    end
  end

  describe '#landing_sharing' do
    # rubocop:disable Rspec/Layout/LineLength
    it 'displays the email links' do
      render
      expect(rendered).to have_link(nil, href: 'mailto:?subject=Check this out!&body=Look at this awesome application for automated time management for students! https://team05.demo1.genesys.shefcompsci.org.uk/. %0D%0AMy favourite feature is the automated timetable creation.', visible: :all)
      expect(rendered).to have_link(nil, href: 'mailto:?subject=Check this out!&body=Look at this awesome application for automated time management for students! https://team05.demo1.genesys.shefcompsci.org.uk/. %0D%0AMy favourite feature is the ability to account for last minute changes.', visible: :all)
      expect(rendered).to have_link(nil, href: 'mailto:?subject=Check this out!&body=Look at this awesome application for automated time management for students! https://team05.demo1.genesys.shefcompsci.org.uk/. %0D%0AMy favourite feature is the ability to track repeating tasks.', visible: :all)
    end

    it 'displays the twitter links' do
      render
      expect(rendered).to have_link(nil, href: 'https://twitter.com/intent/tweet?text=Look+at+this+awesome+application+for+automated+time+management+for+students%21+https%3A%2F%2Fteam05.demo1.genesys.shefcompsci.org.uk%2F.%0D%0AMy+favourite+feature+is+the+automated+timetable+creation.', visible: :all)
      expect(rendered).to have_link(nil, href: 'https://twitter.com/intent/tweet?text=Look+at+this+awesome+application+for+automated+time+management+for+students%21+https%3A%2F%2Fteam05.demo1.genesys.shefcompsci.org.uk%2F.%0D%0AMy+favourite+feature+is+the+ability+to+account+for+last+minute+changes.', visible: :all)
      expect(rendered).to have_link(nil, href: 'https://twitter.com/intent/tweet?text=Look+at+this+awesome+application+for+automated+time+management+for+students%21+https%3A%2F%2Fteam05.demo1.genesys.shefcompsci.org.uk%2F.%0D%0AMy+favourite+feature+is+the+ability+to+track+repeating+tasks.', visible: :all)
    end

    it 'displays the facebook links' do
      render
      expect(rendered).to have_link(nil, href: 'https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fteam05.demo1.genesys.shefcompsci.org.uk%2F&amp;src=sdkpreparse%22&quote=My+favourite+feature+is+the+automated+timetable+creation.', visible: :all)
      expect(rendered).to have_link(nil, href: 'https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fteam05.demo1.genesys.shefcompsci.org.uk%2F&amp;src=sdkpreparse%22&quote=My+favourite+feature+is+the+ability+to+account+for+last+minute+changes.', visible: :all)
      expect(rendered).to have_link(nil, href: 'https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fteam05.demo1.genesys.shefcompsci.org.uk%2F&amp;src=sdkpreparse%22&quote=My+favourite+feature+is+the+ability+to+track+repeating+tasks.', visible: :all)
    end
    # rubocop:enable Rspec/Layout/LineLength
  end
end
