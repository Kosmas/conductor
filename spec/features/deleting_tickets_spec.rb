require 'spec_helper'

feature 'Deleting tickets' do
  let!(:project) { FactoryGirl.create(:project) }
  let(:user) { FactoryGirl.create(:user) }
  let!(:ticket) do
    FactoryGirl.create(:ticket, project: project, author: user)
  end

  before do
    visit project_ticket_path(project, ticket)
  end

  scenario 'deleting successfully' do
    click_link 'Delete Ticket'

    expect(page).to have_content('Ticket has been deleted.')
    expect(page.current_url).to eq(project_url(project))
  end
end
