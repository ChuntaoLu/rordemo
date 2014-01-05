require 'spec_helper'

describe "Micropost Pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "micropost creation" do
    before { visit root_path }

    describe "with invalid information" do
      it 'should not create a micropost' do
        expect { click_button 'Post' }.not_to change(Micropost, :count)
      end
    end

    describe "error message" do
      before { click_button 'Post' }
      it { should have_content('error') }
    end

    describe "with valid information" do
      before { fill_in 'micropost_content', with: 'Lorem ipsum' }
      it 'should create a micropost' do
        expect { click_button 'Post' }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost desruction" do
    before { FactoryGirl.create(:micropost, user: user) }

    describe "as the correct user" do
      before { visit root_path }

      it 'should delete a micropost' do
        expect { click_link 'delete' }.to change(Micropost, :count).by(-1)
      end
    end

    describe "as the wrong user" do
      let(:other) { FactoryGirl.create(:user) }

      before do
        sign_in other
        visit user_path(user)
      end

      it { should_not have_link('delete') }
    end
  end

  describe "micropost count" do

    describe "user has no micropost" do
      before { visit root_path }
      it { should have_content('0 micropost') }
    end

    describe "user has one micropost" do
      before { FactoryGirl.create(:micropost, user: user) }
      before { visit root_path }
      it { should have_content('1 micropost') }
    end

    describe "user has multiple microposts" do
      before do
        5.times { FactoryGirl.create(:micropost, user: user) }
        visit root_path
      end
      it { should have_content('5 microposts') }
    end
  end

  describe "micropost pagination" do
    before do
      50.times { FactoryGirl.create(:micropost, user: user) }
      visit root_path
    end

    it { should have_selector('div.pagination') }
  end
end
