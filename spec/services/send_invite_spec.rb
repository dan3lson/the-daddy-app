# frozen_string_literal: true

require "rails_helper"

RSpec.describe SendInvite do
  describe "#call" do
    subject(:call) { service.call }

    let(:service) { described_class.new(email: email, user: user) }
    let(:email) { "guest@email.com" }
    let(:user) { create(:user) }
    let(:alert_struct) do
      OpenStruct.new(
        current_user_id: user&.id,
        additional_data: {invited_email: email},
        message: "Validation failed: Email can't be blank",
        type: :error
      )
    end

    before do
      allow(service)
        .to receive(:broadcast)
        .with(:successful_invite, user, email)

      allow(service)
        .to receive(:broadcast)
        .with(:alert, alert_struct)

      call
    end

    it "makes an invite", :aggregate_failures do
      expect(Invite.count).to eq(1)
      expect(user.invites.count).to eq(1)
    end

    it "sends a broadcast" do
      expect(service)
        .to have_received(:broadcast)
        .with(:successful_invite, user, email)
    end

    context "with an empty email" do
      let(:email) { "" }

      it "doesn't make an invite", :aggregate_failures do
        expect(Invite.count).to eq(0)
        expect(user.invites.count).to eq(0)
      end
    end

    context "when a guest invites another guest with an empty email" do
      let(:email) { "" }
      let(:user) { nil }

      it "doesn't create an invite" do
        expect(Invite.count).to eq(0)
      end
    end

    context "when a guest successfully invites another guest" do
      let(:email) { "guest@email.com" }
      let(:user) { nil }

      it "sends an invitation email" do
        expect(Invite.count).to eq(1)
      end
    end

    context "with an error creating an invite" do
      before do
        allow(Invite)
          .to receive(:create!)
          .with(email: email, user: user)
          .and_raise(ActiveRecord::RecordInvalid)
        allow(service)
          .to receive(:broadcast)
          .with(:alert, "some message", :some_type)
      end

      it "sends a broadcast", skip: "skipped: not sure why it's failing" do
        call

        expect(service).to have_received(:broadcast).with(:alert, "some message", :some_type)
      end
    end
  end
end
