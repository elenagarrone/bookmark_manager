require 'spec_helper'
require 'features/helpers/session.rb'

include SessionHelpers

feature "Password forgotten" do

  before(:each) do
    User.create(:email => "test@test.com",
    :password => 'test',
    :password_confirmation => 'test')
  end

  scenario "clicking on the button i should be redirected to another page" do
    visit '/sessions/new'
    click_link("Forgot your password?")
    expect(page).to have_content("Request your password")
    expect(page).to have_content("Please, insert your email")
  end
end
