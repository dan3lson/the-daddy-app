# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SendInvite do
  describe '#post' do
    describe 'when a daddy invites a guest with an invalid email' do
      it 'sends an error message (blank email)' do
        user = create(:user)

        SendInvite.new(user: user, guest_email: '').call

        expect(Invite.count).to eq(0)
        expect(user.invites.count).to eq(0)
      end

      it 'sends an error message (nil email)' do
        user = create(:user)

        SendInvite.new(user: user, guest_email: nil).call

        expect(Invite.count).to eq(0)
        expect(user.invites.count).to eq(0)
      end
    end

    describe 'when a daddy successfully invites a guest' do
      it 'sends an invitation email' do
        user = create(:user)

        SendInvite.new(user: user, guest_email: 'guest@email.com').call

        expect(Invite.count).to eq(1)
        expect(user.invites.count).to eq(1)
      end
    end

    describe 'when a guest invites another guest with an invalid email' do
      it 'sends an error message (blank email)' do
        SendInvite.new(guest_email: '').call

        expect(Invite.count).to eq(0)
      end

      it 'sends an error message (nil email)' do
        SendInvite.new(guest_email: nil).call

        expect(Invite.count).to eq(0)
      end
    end

    describe 'when a guest successfully invites another guest' do
      it 'sends an invitation email' do
        SendInvite.new(guest_email: 'guest@email.com').call

        expect(Invite.count).to eq(1)
      end
    end
  end
end
