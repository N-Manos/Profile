require "test_helper"

feature "Deleting a Project" do
  scenario "project is deleted" do
    visit projects_path
    # Given an existing article
    aProject = Project.create(name: "Crocodile Dundee", technologies_used: "That's not a knife this is a knife!")
    #"Destroy"
    aProject.destroy
    visit projects_path
    # Then the article is deleted
    page.wont_have_content "That's not a knife this is a knife!"
  end
end

