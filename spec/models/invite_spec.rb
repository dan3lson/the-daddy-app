require "rails_helper"

RSpec.describe Invite, type: :model do
  it { should belong_to(:user).optional }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:status) }
  subject { create(:invite) }
  it do
    should validate_uniqueness_of(:email)
      .with_message("has already been invited")
  end
end
