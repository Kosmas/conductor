require 'spec_helper'

feature 'hidden links' do
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:admin_user) }
	let(:project) { FactoryGirl.create(:project) }

	context 'anonymous users' do
		scenario 'cannot see the New Project link' do
			visit '/'
	
			expect(page).to_not have_link('New Project')
		end

		scenario 'cannot see the Edit Project link' do
			visit project_path(project)
	
			expect(page).to_not have_link('Edit Project')
		end

		scenario 'cannot see the Delete Project link' do
			visit project_path(project)

			expect(page).to_not have_link('Edit Project')
		end
	end

	context 'regular users' do
		before { sign_in_as!(user) }
		scenario 'cannot see the New Project link' do
			visit '/'

			expect(page).to_not have_link('New Project')
		end

		scenario 'cannot see the Edit Project link' do
      visit project_path(project)

      expect(page).to_not have_link('Edit Project')
    end

    scenario 'cannot see the Delete Project link' do
      visit project_path(project)
  
      expect(page).to_not have_link('Edit Project')
    end
	end

	context 'admin users' do
		before { sign_in_as!(admin) }
		scenario 'can see the New Project link' do
			visit '/'

			expect(page).to have_link('New Project')
		end

		scenario 'can see the Edit Project link' do
      visit project_path(project)

      expect(page).to have_link('Edit Project')
    end

    scenario 'can see the Delete Project link' do
      visit project_path(project)
  
      expect(page).to have_link('Edit Project')
    end
	end
end
