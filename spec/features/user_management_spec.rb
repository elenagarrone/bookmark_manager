require 'spec_helper'
require 'features/helpers/session.rb'

include SessionHelpers

feature "User sign up" do
	scenario "when being logged out" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, alice@example.com")
		expect(User.first.email).to eq("alice@example.com")
	end

	scenario "is not possible if the user is already signed up" do
		sign_up('a@a.com', 'pass', 'pass')
		sign_out('a@a.com', 'pass')
		sign_up('a@a.com', 'pass', 'pass')
		expect(page).to have_content("This email is already taken")
	end

	scenario "is not possible with a password that doesn't match" do
		expect{ sign_up('a@a.com', 'pass', 'wrong') }.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, there were the following problems with the form:")
		expect(page).to have_content("Sorry, your passwords don't match")
	end

	scenario "with an email that is already registered" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect{ sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("Sorry, there were the following problems with the form:")
		expect(page).to have_content("This email is already taken")
	end

end

context "User:" do

	before(:each) do
		User.create(:email => "test@test.com",
		:password => 'test',
		:password_confirmation => 'test')
	end

	feature "signs in" do

		scenario "with correct credentials" do
			visit '/'
			expect(page).not_to have_content("Welcome, test@test.com")
			sign_in('test@test.com','test')
			expect(page).to have_content("Welcome, test@test.com")
		end

		scenario "not possible with incorrect credentials" do
			visit '/'
			expect(page).not_to have_content("Welcome, test@test.com")
			sign_in('test@test.com','wrong')
			expect(page).to have_content("Sorry, there were the following problems with the form:")
			expect(page).to have_content("The email or password is incorrect")
			expect(page).not_to have_content("Welcome, test@test.com")
		end

	end

	feature 'signs out' do

		scenario 'while being signed in' do
			sign_in('test@test.com', 'test')
			click_button "Sign out"
			expect(page).to have_content("Thank you for visiting, come back soon!")
			expect(page).not_to have_content("Welcome, test@test.com")
		end

	end

end
