require 'spec_helper'

feature 'Users can comment on tickets' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project, author: user) }

  before do
    login_as(user)
    assign_role!(user, :manager, project)
    FactoryGirl.create(:state, name: 'Open')

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

  scenario "when changing a ticket's state" do
    click_link ticket.title
    fill_in 'Text', with: 'This is a real issue'
    select 'Open', from: 'State'
    click_button 'Create Comment'

    expect(page).to have_content('Comment has been created.')
    within('#ticket .state') do
      expect(page).to have_content('Open')
    end
  end
end
