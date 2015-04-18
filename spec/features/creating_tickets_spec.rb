require 'spec_helper'

feature 'Creating Tickets' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    project = FactoryGirl.create(:project, name: 'Mozilla Firefox')
    assign_role!(user, :editor, project)
    login_as(user)

    visit '/'
    click_link 'Mozilla Firefox'
    click_link 'New Ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Description', with: 'My pages are ugly!'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created.')
    within("#ticket #author") do
      expect(page).to have_content("Created by #{user.email}")
    end
  end

  scenario 'with missing fields' do
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario 'with an invalid Description' do
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Description', with: 'it sucks'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content('Description is too short')
  end
end
