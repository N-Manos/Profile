require "test_helper"

class EditingAPostTest < Capybara::Rails::TestCase

feature "Editing a Post" do
  scenario "submit updates to an existing article" do
#    article = Post.create(id: 23523, name: "Crocodile Dundee", title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    sign_in(:author)
    visit new_post_path

    fill_in "Name", with: posts(:create_post).name
    fill_in "Title", with: posts(:create_post).title
    fill_in "Content", with: posts(:create_post).content

    click_on "Create Post"
    Capybara.match = :first
    click_on("Edit")
#     save_and_open_page
    fill_in "Title", with: posts(:second_post).title
    click_on "Update Post"
    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end

  scenario "authors can update posts to fix typos" do
  end

  scenario "editors can update posts to fix typos" do
  end



end
end
