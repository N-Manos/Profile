require "test_helper"

class EditingAnArticleTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
    Post.create(title: 'Becoming a Code Fellow', content: 'Means striving for excellence.')
    visit posts_path
    page.text.must_include 'Becoming a Code Fellow'
  end
end
