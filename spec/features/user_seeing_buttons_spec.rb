require 'spec_helper'
require 'features/helpers/session.rb'

include SessionHelpers

feature 'While user is signs out' do

  before(:each) do
    User.create(:email => "test@test.com",
        :password => 'test',
        :password_confirmation => 'test')
        sign_in("test@test.com", "test")
        sign_out("test@test.com", "test")
  end

  feature "while on the homepage" do

    scenario "can see the 'Sign in' button" do
      visit '/'
      expect(page).to have_link('Sign in')
    end

    scenario "can see the 'Sign up' button" do
      visit '/'
      expect(page).to have_link('Sign up')
    end

  end

end