require "test_helper"

class CreatingAPostTest < Capybara::Rails::TestCase

feature "Creating a post" do
  scenario "submit form data to create a new article" do
    # Given a completed new article form
    visit new_post_path
    fill_in "Name", with: posts(:create_post).name
    fill_in "Title", with: posts(:create_post).title
    fill_in "Content", with: posts(:create_post).content

    # When I submit the form
    click_on "Create Post"

    # Then a new article should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include "how I learned to make web apps"
  end
end
end