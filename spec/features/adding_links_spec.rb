require 'spec_helper'
require 'features/helpers/session.rb'

include SessionHelpers

feature "User adds a new link" do

  scenario "only when logged in" do
    visit '/'
    expect(page).not_to have_button('Add link')
    User.create(:email => "test@test.com",
        :password => 'test',
        :password_confirmation => 'test')
    sign_in("test@test.com", "test")
    expect(page).to have_content("Add link")
  end

  scenario "when browsing the homepage" do
    expect(Link.count).to eq(0)
    visit '/links/new'
    add_link("http://www.makersacademy.com/", "Makers Academy")
    expect(Link.count).to eq(1)
    link = Link.first
    expect(link.url).to eq("http://www.makersacademy.com/")
    expect(link.title).to eq("Makers Academy")
  end

  scenario "with a few tags" do
    visit '/links/new'
    add_link("http://www.makersacademy.com/",
          "Makers Academy",
          ['education', 'ruby'])
    link = Link.first
    expect(link.tags.map(&:text)).to include('education')
    expect(link.tags.map(&:text)).to include('ruby')
  end

end
