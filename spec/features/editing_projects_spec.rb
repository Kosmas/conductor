require 'spec_helper'

feature 'Editing Projects' do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: 'Vim') }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)

    visit '/'
    click_link 'Vim'
    click_link 'Edit Project'
  end

  scenario 'Updating a project' do
    fill_in 'Name', with: 'Vim beta'
    click_button 'Update Project'

    expect(page).to have_content('Project has been updated.')
  end

  scenario 'Updating a project with invalid attributes' do
    fill_in 'Name', with: ''
    click_button 'Update Project'

    expect(page).to have_content('Project has not been updated.')
  end
end
