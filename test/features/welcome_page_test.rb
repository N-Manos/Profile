require "test_helper"

class WelcomePageTest < Capybara::Rails::TestCase
  test "index page says welcome" do
    visit 'http://localhost:3000'
    assert_content page, "Welcome"
  end
end
