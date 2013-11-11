require 'spec_helper'

feature 'Viewing projects' do
  scenario 'Listing all projects' do
    project = FactoryGirl.create(:project, name: 'Vim')
    visit '/'
    click_link 'Vim'
    expect(page.current_url).to eql(project_url(project))
  end
end
