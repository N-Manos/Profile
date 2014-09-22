require "test_helper"

feature "As the site owner, I want to add a portfolio item so that I can show off my work" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New Project"
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    assert page.has_css?(".alert-box.success"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end

  scenario "form is missing data" do

    visit new_project_path
    fill_in "Name", with: "Q"

    click_on "Create Project"

    current_path.must_match /projects$/
    page.text.must_include "Project could not be saved"
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end



