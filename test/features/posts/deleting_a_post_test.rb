require "test_helper"

class DeletingAnArticleTest < Capybara::Rails::TestCase

require "test_helper"

feature "Deleting a Post" do
  scenario "article is deleted with a click" do
    # Given an existing article
    aPost = Post.create(id: 23523, name: "Crocodile Dundee", title: "Hunting Crocidiles is Amazing!", content: "Means striving for excellence.")

    # When the delete link is clicked
    # click_on "Destroy"
    aPost.destroy
    visit posts_path
    # Then the article is deleted
    page.wont_have_content "Hunting Crocidiles is Amazing!"
  end
end
end
