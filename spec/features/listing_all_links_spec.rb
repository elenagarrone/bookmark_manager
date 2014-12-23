require 'spec_helper'
require 'features/helpers/session.rb'

feature "User browses the list of links" do

	before(:each) {
		Link.create(:url => "http://www.google.com",
					:title => "Google",
					:tags => [Tag.first_or_create(:text => 'search')])
		Link.create(:url => "http://www.bing.com",
					:title => "Bing",
					:tags => [Tag.first_or_create(:text => 'search')])
		Link.create(:url => "http://www.code.org",
					:title => "Code.org",
					:tags => [Tag.first_or_create(:text => 'education')])
		sign_up
	}


		scenario "when opening the home page" do
			visit '/'
			expect(page).to have_content("Makers Academy")
		end

		scenario "by typing the tag and pressing a button" do
			visit '/'
			expect(page).to have_button('Search tag')
		end

		scenario "filtered tags" do
				visit '/'
				fill_in("search_tags", with: "search")
				click_button('Search tag')
				expect(page).not_to have_content("Code.org")
				expect(page).to have_content("Google")
				expect(page).to have_content("Bing")
		end

end
