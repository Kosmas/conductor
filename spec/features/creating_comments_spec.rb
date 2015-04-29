require 'spec_helper'

feature 'Users can comment on tickets' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project, author: user) }

  before do
    login_as(user)
    assign_role!(user, :manager, project)

    visit '/'
    click_link project.name
  end

  scenario 'with valid attributes' do
    click_link ticket.title
    fill_in 'Text', with: 'Added a comment!'
    click_button 'Create Comment'

    expect(page).to have_content('Comment has been created.')
    within('#comments') do
      expect(page).to have_content('Added a comment!')
    end
  end

  scenario 'with invalid attributes' do
    click_link ticket.title
    click_button 'Create Comment'

    expect(page).to have_content('Comment has not been created.')
  end
end
