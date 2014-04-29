require 'spec_helper'

describe "UserPages" do

	subject { page }
	
	describe "signup page" do
		before { visit signup_path }

		it { should have_selector('h1',       text: 'Sign up') }
		it { should have_selector('title',    text: 'Sign up') }
	end

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }

		before { visit user_path(user) }

		it { should have_selector('h1',       text: user.name) }
		it { should have_selector('title',    text: user.name)}
	end	

	describe "signup" do

		before { visit signup_path }

		describe "with valid information" do
			it "should create a user" do

			end
		end

		describe "with invalid information" do
			it "should not create a user" do
				old_count - User.old_count
				click_button "Create my account"
				new_count = User.new_count
				new_count.should == old_count
			end
		end

end
