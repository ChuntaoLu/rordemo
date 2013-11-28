require 'spec_helper'

describe "Static Pages" do

  subject { page }

  shared_examples_for 'all static pages' do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About me')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Projects"
    page.should have_selector 'title', text: full_title('Projects')
    click_link "Home"
    click_link "Sign up"
    page.should have_selector 'title', text: full_title('Sign up')
    click_link "Sign in"
    page.should have_selector 'title', text: full_title('Sign in')
    click_link "Chuntao Lu"
    page.should have_selector 'title', text: full_title('')
  end

  describe "Home page" do

    before { visit root_path }
    #equivolent as below:
    #before(:each) do
    #  visit root_path
    #end
    let(:heading) { "Lu's homepage" }
    let(:page_title) { '' }
    it_should_behave_like 'all static pages'
    it { should_not  have_selector('title', :text => "| Home") }
  end

  describe "Projects" do

    before { visit projects_path }

    let(:heading) { 'Projects' }
    let(:page_title) { 'Projects' }
    it_should_behave_like 'all static pages'
  end


  describe "Help page" do

    before { visit help_path }

    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like 'all static pages'
  end

  describe "About page" do

    before { visit about_path }

    let(:heading) { 'About' }
    let(:page_title) { 'About' }
    it_should_behave_like 'all static pages'
  end

  describe "Contact page" do

    before { visit contact_path }

    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }
    it_should_behave_like 'all static pages'
  end
end
