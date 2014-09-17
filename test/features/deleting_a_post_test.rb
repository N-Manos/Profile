require "test_helper"

class DeletingAnArticleTest < Capybara::Rails::TestCase

require "test_helper"

feature "Deleting a Post" do
  scenario "article is deleted with a click" do
    # Given an existing article
    Post.create(id: 23523, name: "Crocodile Dundee", title: "Becoming a Code Fellow", content: "Means striving for excellence.")
    visit posts_path

    # When the delete link is clicked
    click_on "Destroy"

    # Then the article is deleted
    page.wont_have_content "Becoming a Code Fellow"
  end
end
end
