require 'spec_helper'

feature 'Editing tickets' do
  let!(:project) { FactoryGirl.create(:project) }
  let(:user) { FactoryGirl.create(:user) }
  let!(:ticket) do
    FactoryGirl.create(:ticket, project: project, author: user)
  end

  before do
    login_as(user)
    assign_role!(user, :viewer, project)

    visit project_ticket_path(project, ticket)
    click_link 'Edit Ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Make it really shiny!'
    click_button 'Update Ticket'

    expect(page).to have_content 'Ticket has been updated.'

    within('#ticket h2') do
      expect(page).to have_content('Make it really shiny!')
    end

    expect(page).to_not have_content(ticket.title)
  end

  scenario 'with invalid attributes' do
    fill_in 'Title', with: ''
    click_button 'Update Ticket'

    expect(page).to have_content('Ticket has not been updated.')
  end
end
