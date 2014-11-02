require "test_helper"

class AuthorAuthTest < Capybara::Rails::TestCase
  #As an author I want to only see my own articles so that I can focus on my work

  feature "Creating a post" do
    scenario "submit form data to create a new article" do
      sign_in_and_create_a_post

      visit posts_path

      page.text.wont_include "Code Fellows OMG!"
    end
  end

  #As an author I want to create articles so that I can share great content with the world
  feature "Creating a post as an author" do
    scenario "submit form data to create a new article" do

      sign_in_and_create_a_post

      page.text.must_include "Post was successfully created"
    end
  end

  #As an author I want to update articles so that I can fix typos
  feature "Updating a post as an author" do
    scenario "submit form data to create a new article" do

      sign_in_and_create_a_post
      click_on "Edit"
      click_on "Update"
      page.text.must_include "Post was successfully updated"
    end
  end
  #As an author I should not be able to publish articles so that I can give the editor publishing control, and I should see a 'not authorized' message if I try to hack it
  feature "Publish a post fails for author" do
    scenario "trying to publish a post without proper authorization fails" do

      sign_in_and_create_a_post
      page.wont_have_field('Published')
    end
  end

  #As an author I should not be able to delete articles so that I can give the editor publishing control
  feature "Deleting a post fails for author" do
    scenario "trying to delete a post without proper authorization fails" do
      sign_in_and_create_a_post

      page.text.wont_include "Post was successfully destroyed."
    end
  end

  def sign_in_and_create_a_post
    sign_in(:author)
    visit new_post_path

    fill_in "Name", with: posts(:create_post).name
    fill_in "Title", with: posts(:create_post).title
    fill_in "Content", with: posts(:create_post).content

    click_on "Create Post"
  end

end

