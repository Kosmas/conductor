require 'spec_helper'

feature 'Creating Projects' do
  scenario "can create a project" do
    visit '/'

    click_link 'New Project'

    fill_in 'Name', with: 'Vim'
    fill_in 'Description', with: 'A text-editor for Linux'
    click_button 'Create Project'

    expect(page).to have_content('Project has been created.')

    project = Project.where(name: "Vim").first

    expect(page.current_url).to eql(project_url(project))

    title = "Vim - Projects - Conductor"
    expect(page).to have_title(title)
  end
end
