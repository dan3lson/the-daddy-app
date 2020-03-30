# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompleteInvite do
  describe '#call' do
    describe 'when a new daddy signs up (without an invitation)' do
      it 'does nothing to any existing invitations' do
        user = create(:user)

        CompleteInvite.new(email: user.email).call

        expect(Invite.count).to eq(0)
        expect(Invite.complete.size).to eq(0)
      end
    end

    describe 'when a new daddy signs up (with an invitation)' do
      it 'updates their invitation to be completed' do
        invite = create(:invite)
        user = create(:user, email: invite.email)

        CompleteInvite.new(email: user.email).call

        expect(Invite.count).to eq(1)
        expect(Invite.complete.size).to eq(1)
        expect(Invite.pending.size).to eq(0)
      end
    end
  end
end
