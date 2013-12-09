require 'spec_helper'

feature 'Viewing tickets' do
  before do
		user = FactoryGirl.create(:user)
    vim_2 = FactoryGirl.create(:project, name: 'Vim2')
    ticket_1 = FactoryGirl.create(:ticket, project: vim_2, title: 'Make it shiny!', description: 'Gradients! Starbursts! Oh my!')
		ticket_1.update(user: user)
		define_permission!(user, 'view', vim_2)
    internet_explorer = FactoryGirl.create(:project, name: 'Internet Explorer')
    ticket_2 = FactoryGirl.create(:ticket, project: internet_explorer, title: 'Standards compliance', description: "Isn't a joke.")
		ticket_2.update(user: user)
		define_permission!(user, 'view', internet_explorer)
		sign_in_as!(user)
    visit '/'
  end

  scenario 'Viewing tickets for a given project' do
    click_link 'Vim2'

    expect(page).to have_content('Make it shiny!')
    expect(page).to_not have_content('Standards complicance')

    click_link 'Make it shiny!'
    within('#ticket h2') do
      expect(page).to have_content('Make it shiny!')
    end

    expect(page).to have_content('Gradients! Starbursts! Oh my!')
  end
end
