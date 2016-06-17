require 'rails_helper'

describe 'user pages' do
  subject {page}

  describe 'signup page' do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create new user" do
        expect { click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name", with: "John"
        fill_in "Email", with: "jd@ve.anahoret.com"
        fill_in "Password", with: "password"
        fill_in "Confirmation", with: "password"

      end

      it "should create new user" do
        expect{ click_button submit}.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'jd@ve.anahoret.com') }

        it { should have_link('Sign out') }
        it { should have_title(full_title(user.name)) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end

    it { should have_content('Sign up') }
    it { should have_title(full_title('Sign up')) }

  end

  describe 'profile page' do
    let!(:user){ FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(full_title(user.name)) }
  end
end

