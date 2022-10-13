# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateWaitlistUser do
  describe '#call' do
    subject(:call) do
      described_class.call(
        email:         email,
        daddy_type:    "juggler",
        first_name:    "Danelson Sr.",
        referral_code: referral_code
      )
    end

    let(:email)         { "some email" }
    let(:referral_code) { nil }

    it "creates a new WaitlistUser record" do
      expect { call }.to change(WaitlistUser, :count).by(1)
    end

    context "with an email which already exists"
    context "with a referral code"
    context "with a referral code for an email which already exists"
    context "with a referral code which can't be found"
  end
end
