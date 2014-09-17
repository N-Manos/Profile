require "test_helper"

class EditingAPostTest < Capybara::Rails::TestCase

feature "Editing an Article" do
  scenario "submit updates to an existing article" do

    article = Post.create(id: 23523, name: "Crocodile Dundee", title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    visit post_path(article)

    click_on "Edit"
    fill_in "Title", with: "Becoming a Web Developer"
    click_on "Update Post"

    page.text.must_include "Post was successfully updated"
    page.text.must_include "Web Developer"
  end
end
end
