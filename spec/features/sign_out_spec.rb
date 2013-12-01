require 'spec_helper'

feature 'signing out.' do
	scenario 'Signing out' do
		user = FactoryGirl.create(:user)

		visit '/'
		click_link 'Sign in'
		fill_in 'Name', with: user.name
		fill_in 'Password', with: user.password
		click_button 'Sign in'
		click_link 'Sign out'

		expect(page).to have_content('Signed out successfully')
	end
end
