require "test_helper"

class EditorAuthTest < Capybara::Rails::TestCase
  #As an editor I want to see all articles regardless of published status in the blog index so that I can choose which articles to publish
  feature "Viewing all posts as editor" do
    scenario "sign in and check which posts are displaying" do
      sign_in_and_create_a_post
      visit posts_path

      page.text.must_include "This is how I learned to make web apps."

      page.text.must_include "Code Fellows OMG!"
    end
  end

  #As an editor I want to create articles so that I can share great content with the world
  feature "Creating a post" do
    scenario "submit form data to create a new article" do
  #    sign_in_as_editor
      sign_in_and_create_a_post
      visit posts_path
      page.text.must_include "This is how I learned to make web apps."
    end
  end

  #As an editor I want to update articles so that I can fix typos
  feature "Updating a post" do
    scenario "sign in and update a new post" do
  #    sign_in_as_editor
      sign_in_and_create_a_post
      click_on "Edit"
      click_on "Update Post"
      page.text.must_include "Post was successfully updated"
    end
  end

  #As an editor I want to delete articles so that I can remove opium-fueled Jabberwocky
  feature "Deleting a post" do
    scenario "sign in and delete a post" do
  #    sign_in_as_editor
      sign_in_and_create_a_post
      visit posts_path
      Capybara.match = :first
      click_on "Destroy"
      page.text.must_include "Post was successfully destroyed."
    end
  end

  def sign_in_and_create_a_post
    sign_in(:editor)
    visit new_post_path

    fill_in "Name", with: posts(:create_post).name
    fill_in "Title", with: posts(:create_post).title
    fill_in "Content", with: posts(:create_post).content

    click_on "Create Post"
  end

end
