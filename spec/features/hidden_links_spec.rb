require 'spec_helper'

feature 'hidden links' do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  context 'anonymous users' do
    scenario 'cannot see the New Project link' do
      visit '/'
      expect(page).to_not have_link('New Project')
    end
  end

  context 'regular users' do
    before { login_as(user) }

    scenario 'cannot see the New Project link' do
      visit '/'
      expect(page).to_not have_link('New Project')
    end
  end

  context 'admin users' do
    before { login_as(admin) }

    scenario 'can see the New Project link' do
      visit '/'
      expect(page).to have_link('New Project')
    end
  end
end
