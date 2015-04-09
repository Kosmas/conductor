require 'spec_helper'

feature "An admin can change a user's details" do
  let!(:admin_user) { FactoryGirl.create(:user, :admin) }
  let!(:user) { FactoryGirl.create(:user) }

  before do
    login_as(admin_user)
    visit '/'
    click_link 'Admin'
    click_link 'Users'
    click_link user.email
    click_link 'Edit User'
  end

  scenario 'with valid details' do
    fill_in 'Email', with: 'newguy@example.com'
    click_button 'Update User'

    expect(page).to have_content('User has been updated.')
    expect(page).to have_content('newguy@example.com')
    expect(page).to_not have_content(user.email)
  end

  scenario "when toggling a user's admin ability" do
    check "Is an admin?"
    click_button 'Update User'

    expect(page).to have_content('User has been updated.')
    expect(page).to have_content("#{user.email} (Admin)")
  end
end
