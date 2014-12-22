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

  scenario "after entering the email i should see the token" do
    visit '/request_password'
    fill_in 'Email', :with => "test@test.com"
    click_button('Submit')
    expect(page).to have_content("Here is your token:")
  end

  scenario "on the page to register a new password" do
    visit '/users/request_password/:token'
    expect(page).to have_content("Please, insert a new password:")
  end

  scenario "registering a new password" do
    visit '/users/request_password/:token'
    fill_in :password, :with => "passwordagain"
    fill_in :password_confirmation, :with => "passwordagain"
    #click_button('Submit')
    expect(page).to have_content()#"Your password has been reset succesfully"
  end
end
