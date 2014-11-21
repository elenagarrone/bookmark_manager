require 'spec_helper'
require 'features/helpers/session.rb'

feature "User browses the list of links" do
	
	before(:each) {
		Link.create(:url => "http://www.makersacademy.com",
					:title => "Makers Academy",
					:tags => [Tag.first_or_create(:text => 'education')])
		Link.create(:url => "http://www.google.com",
					:title => "Google",
					:tags => [Tag.first_or_create(:text => 'search')])
		Link.create(:url => "http://www.bing.com",
					:title => "Bing",
					:tags => [Tag.first_or_create(:text => 'search')])
		Link.create(:url => "http://www.code.org",
					:title => "Code.org",
					:tags => [Tag.first_or_create(:text => 'education')])
	}
	

	scenario "when opening the home page" do
		visit '/'
		expect(page).to have_content("Makers Academy")
	end

	feature "User can search"


		scenario "by typing the tag and pressing a button" do
			visit '/users/new'
			expect(page.status_code).to eq(200)
			fill_in :email, :with => "email@email.com"
			fill_in :password, :with => "password"
			fill_in :password_confirmation, :with => "password"
			click_button "Sign up"
			save_and_open_page
			expect(page).to have_button('Search tag')
		end

		scenario "filtered tags" do
			visit '/tags/search'
			expect(page).not_to have_content("Makers Academy")
			expect(page).not_to have_content("Code.org")
			expect(page).to have_content("Google")
			expect(page).to have_content("Bing")
		end

end