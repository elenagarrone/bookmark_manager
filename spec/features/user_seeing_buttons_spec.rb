require 'spec_helper'
require 'features/helpers/session.rb'

include SessionHelpers


feature "Buttons" do

  before(:each) do
    User.create(:email => "test@test.com",
        :password => 'test',
        :password_confirmation => 'test')
    sign_in("test@test.com", "test")
  end
      
    feature 'While user is signed out' do

      feature "while on the homepage" do
        scenario "can see the 'Sign in' and 'Sign up'" do
          sign_out("test@test.com", "test")
          visit '/'
          expect(page).to have_link('Sign in')
          expect(page).to have_link('Sign up')
          expect(page).not_to have_button('Sign out')
          expect(page).not_to have_link('Add link')
          expect(page).not_to have_button('Search tag')
        end
      end

      feature "while on the sign in page" do
        scenario "can see the 'Sign up'" do
          sign_out("test@test.com", "test")
          visit '/sessions/new'
          expect(page).to have_link('Sign up')
          expect(page).not_to have_button('Search tag')
          expect(page).not_to have_button('Sign out')
          expect(page).not_to have_link('Add link')
          expect(page).not_to have_link('Sign in')
        end
      end
  
    end

    feature "While user is signed in" do

      feature "while on the homepage" do
        scenario "can see the 'Sign out' and 'Add link'" do
          visit '/'
          expect(page).to have_button('Sign out')
          expect(page).to have_button('Search tag')
          expect(page).to have_link('Add link')
          expect(page).not_to have_link('Sign in')
          expect(page).not_to have_link('Sign up')
        end
      end

      feature "while on the add link page" do
        scenario "can see the 'Sign out'" do
          visit '/links/new'
          expect(page).to have_button('Sign out')
          expect(page).not_to have_button('Search tag')
          expect(page).not_to have_link('Add link')
          expect(page).not_to have_link('Sign in')
          expect(page).not_to have_link('Sign up')
        end
      end

      feature "while on the sign in page" do
        scenario "can see the 'Sign out'" do
          visit '/sessions/new'
          expect(page).to have_button('Sign out')
          expect(page).to have_button('Search tag')
          expect(page).to have_link('Add link')
          expect(page).not_to have_link('Sign in')
          expect(page).not_to have_link('Sign up')
        end
      end

      feature "while on the sign up page" do
        scenario "can see the 'Sign out'" do
          visit '/users/new'
          expect(page).to have_button('Sign out')
          expect(page).to have_button('Search tag')
          expect(page).to have_link('Add link')
          expect(page).not_to have_link('Sign in')
          expect(page).not_to have_link('Sign up')
        end
      end

    end

end