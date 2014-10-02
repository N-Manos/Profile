require "test_helper"

class CreatingAPostTest < Capybara::Rails::TestCase

feature "Creating a post" do
  scenario "submit form data to create a new article" do
#    sign_up_a_new_user
    sign_in(:author)
    visit new_post_path

    fill_in "Name", with: posts(:create_post).name
    fill_in "Title", with: posts(:create_post).title
    fill_in "Content", with: posts(:create_post).content

    # When I submit the form
    click_on "Create Post"

    # Then a new article should be created and displayed
    page.text.must_include "Post was successfully created"
    page.text.must_include "how I learned to make web apps"
    page.has_css? "#author"
    page.text.must_include "author@example.com"
    page.text.must_include "Status: Unpublished"
  end

  scenario "unauthenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
  end

  scenario "unauthenticated site vistiors cannot see new post button" do
    # When I visit the blog index page
    visit posts_path
    # Then I should not see the "New Article" button
    page.wont_have_link "New Article"
  end

  scenario "authors can't publish" do
    # Given an author's account
    sign_in(:author)

    # When I visit the new page
    visit new_post_path

    # There is no checkbox for published
    page.wont_have_field('published')
  end

  scenario "editors can publish" do
    # Given an editor's account
    sign_in(:editor)

    # When I visit the new page
    visit new_post_path

    # There is a checkbox for published
    page.must_have_field('Published')

    # When I submit the form
    fill_in "Name", with: posts(:cr).name
    fill_in "Title", with: posts(:cr).title
    fill_in "Content", with: posts(:cr).content
    check "Published"
    click_on "Create Post"

    # Then the published article should be shown
    page.text.must_include "Status: Published"
  end

end
end
