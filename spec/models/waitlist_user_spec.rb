require 'rails_helper'

RSpec.describe WaitlistUser, type: :model do
  describe "validations" do
    it { should validate_presence_of(:daddy_type) }
    it { should validate_presence_of(:email) }
  end

  describe "callbacks" do
    context "when saving an email address" do
      let(:waitlist_user) { create(:waitlist_user, email: "sOmE.EmAIL@domain.COM") }

      it { expect(waitlist_user.email).to eq("some.email@domain.com") }
    end
  end
end
