require 'spec_helper'

feature 'Deleting projects' do
  before do
    login_as(FactoryGirl.create(:user, :admin))
  end

  scenario 'Deleting a project' do
    FactoryGirl.create(:project, name: 'Vim')

    visit '/'
    click_link 'Vim'
    click_link 'Delete Project'

    expect(page).to have_content('Project has been deleted.')

    visit '/'

    expect(page).to have_no_content('Vim')
  end
end
