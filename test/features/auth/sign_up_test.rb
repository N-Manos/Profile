require "test_helper"

feature("
  As a site visitor, I want to be able to sign up for an account,
  so that I can perform actions that require me to be logged in.
") do
  scenario "sign up" do
    #Given a registration form that I fill in with appropriate details
    sign_up_a_new_user

    # Then I should be signed up
    page.must_have_content "Welcome! You have signed up successfully"
    page.wont_have_content "There was a problem with your sign up"
  end
end

feature ("As a site visitor, I want to be able to sign out of my account,
  so that I can safely let others use the site" ) do
  scenario "sign out" do
    #Given a registration form that I fill in with appropriate details
    sign_up_a_new_user

    #Then I click on Sign Out
    visit "/"
    click_on "Sign Out"

    #I should get a message for a successful sign out
    page.must_have_content "Signed out successfully"
  end
end

def sign_up_a_new_user
  # Given a registration form
  visit "/"
  click_on "Sign Up"

  # When I register with valid info
  fill_in "Email", with: "test@example.com"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_on "Sign up"
end
