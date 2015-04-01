require 'spec_helper'

feature 'Viewing tickets' do
  before do
    user = FactoryGirl.create(:user)
    vim_2 = FactoryGirl.create(:project, name: 'Vim2')
    FactoryGirl.create(:ticket,
                       project: vim_2,
                       title: 'Make it shiny!',
                       description: 'Gradients! Starbursts! Oh my!',
                       author: user)

    internet_explorer = FactoryGirl.create(:project, name: 'Internet Explorer')
    FactoryGirl.create(:ticket,
                       project: internet_explorer,
                       title: 'Standards compliance',
                       description: "Isn't a joke.",
                       author: user)

    visit '/'
  end

  scenario 'for a given project' do
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
