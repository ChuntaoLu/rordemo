require 'spec_helper'

describe "Static Pages" do

  let(:base_title) {"Chuntao Lu"}

  describe "Home page" do
    it "should have h1 'Lu's homepage'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => "Lu's homepage")
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', :text => "#{base_title}")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not  have_selector('title', :text => "| Home")
    end
  end

  describe "Projects" do
    it "should have h1 'Projects'" do
      visit '/static_pages/projects'
      page.should have_selector('h1', :text => "Projects")
    end

    it "should have the title 'Projects'" do
      visit '/static_pages/projects'
      page.should have_selector('title', :text => "#{base_title} | Projects")
    end
  end


  describe "Help page" do
    it "should have h1 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => "Help")
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title', :text => "#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have h1 'About me'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => "About")
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      page.should have_selector('title', :text => "#{base_title} | About")
    end
  end

  describe "Contact page" do
    it "should have h1 'About me'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => "Contact")
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('title', :text => "#{base_title} | Contact")
    end
  end
end
