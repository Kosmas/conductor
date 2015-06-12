require 'spec_helper'

describe CommentsController do
  let(:user) { FactoryGirl.create(:user) }
  let(:project) { Project.create!(name: 'Conductor') }
  let(:state) { State.create!(name: 'Hacked') }

  let(:ticket) do
    project.tickets.create(title: 'State transitions',
                           description: "Can't be hacked.",
                           author: user)
  end

  context 'a user without permission to set state' do
    before(:each) do
      assign_role!(user, :editor, project)
      sign_in user
    end

    it 'cannot transition a state by passing through state_id' do
      post :create, { comment: { text: 'Did I hack it??',
                                 state_id: state.id },
                      ticket_id: ticket.id }
      ticket.reload

      expect(ticket.state).to be_nil
    end
  end
end
