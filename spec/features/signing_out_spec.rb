require 'spec_helper'

feature 'A signed in user can sign out.' do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(user)
  end

  scenario do
    visit '/'
    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
  end
end
