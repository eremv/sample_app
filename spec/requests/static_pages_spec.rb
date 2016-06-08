require 'rails_helper'

describe "Static pages" do
  let!(:page_title){"Ruby on Rails Tutorial Sample App |"}

  describe "Home page" do
    before do
      visit '/static_pages/home'
    end

    it "shold have content 'Sample App'" do
      expect(page).to have_content("Sample App")
    end

    it "should have the title 'Home'" do
      expect(page).to have_title("#{page_title} Home")
    end
  end

  describe "Help page" do
    before do
      visit '/static_pages/help'
    end

    it "shoud have content 'Help'" do
      expect(page).to have_content("Help")
    end

    it "should have the title 'Help'" do
      expect(page).to have_title("#{page_title} Help")
    end
  end

  describe "About page" do
    before do
      visit '/static_pages/about'
    end

    it "should have content 'About'" do
      expect(page).to have_content("About")
    end

    it "should have the title 'About'" do
      expect(page).to have_title("#{page_title} About")
    end
  end

  describe "Contact us page" do
    before do
      visit '/static_pages/contact'
    end

    it "shoudl have content 'Contact'" do
      expect(page).to have_content('Contact')
    end

    it "should have titile 'Contact'" do
      expect(page).to have_title("#{page_title} Contact")
    end

  end
end
