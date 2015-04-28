require 'spec_helper'

feature 'Creating Tickets' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    project = FactoryGirl.create(:project, name: 'Mozilla Firefox')
    assign_role!(user, :editor, project)
    login_as(user)

    visit '/'
    click_link 'Mozilla Firefox'
    click_link 'New Ticket'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Description', with: 'My pages are ugly!'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created.')
    within("#ticket #author") do
      expect(page).to have_content("Created by #{user.email}")
    end
  end

  scenario 'with missing fields' do
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario 'with an invalid Description' do
    fill_in 'Title', with: 'Non-standards compliance'
    fill_in 'Description', with: 'it sucks'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content('Description is too short')
  end

  scenario 'with an attachment' do
    fill_in 'Title', with: 'Add documentation for blink tag'
    fill_in 'Description', with: 'The blink tag has a speed attributes'
    attach_file 'File #1', 'spec/fixtures/speed.txt'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created.')
    within("#ticket .assets") do
      expect(page).to have_content('speed.txt')
    end
  end

  scenario 'persisting file uploads across form displays' do
    attach_file 'File #1', 'spec/fixtures/speed.txt'
    click_button'Create Ticket'

    fill_in 'Title', with: 'Add documentation for blink tag'
    fill_in 'Description', with: 'The blink tag has a speed attribute'
    click_button 'Create Ticket'

    within('#ticket .assets') do
      expect(page).to have_content('speed.txt')
    end
  end

  scenario 'with multiple attachments', js: true  do
    fill_in 'Title', with: 'Add documentation for blink tag'
    fill_in 'Description', with: 'The blink tag has a speed attribute'

    attach_file 'File #1', Rails.root.join('spec/fixtures/speed.txt')
    click_link 'Add another file'

    attach_file 'File #2', Rails.root.join('spec/fixtures/spin.txt')
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created.')

    within('#ticket .assets') do
      expect(page).to have_content('speed.txt')
      expect(page).to have_content('spin.txt')
    end
  end
end
