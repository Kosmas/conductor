require 'spec_helper'

feature "Admins can manage a user's roles" do
  let!(:admin) { FactoryGirl.create(:user, :admin) }
  let!(:user) { FactoryGirl.create(:user) }

  let!(:ie) { FactoryGirl.create(:project, name: 'Internet Explorer') }
  let!(:sublime) { FactoryGirl.create(:project, name: 'Sublime Text 3') }

  before do
    login_as(admin)

    visit '/'
    click_link 'Admin'
    click_link 'Users'
  end

  scenario 'when assigning roles to an existing user' do
    click_link user.email
    click_link 'Edit User'

    select 'Viewer', from: 'Internet Explorer'
    select 'Manager', from: 'Sublime Text 3'

    click_button 'Update User'
    expect(page).to have_content('User has been updated')

    click_link user.email
    expect(page).to have_content('Internet Explorer: Viewer')
    expect(page).to have_content('Sublime Text 3: Manager')
  end
end

