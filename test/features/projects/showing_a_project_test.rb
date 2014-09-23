require "test_helper"

feature "As the site visitor, I want to be able to view a single project" do
  scenario "viewing a project" do
    # When I visit /projects
    visit projects_path
    #and click show....
    first(:link, 'Show').click
    # Then I should see the project details
    page.text.must_include "Barnyard Cereal"
  end
end

