require 'rails_helper'

RSpec.describe WaitlistUser, type: :model do
  describe "validations" do
    it { should validate_presence_of(:daddy_type) }
    it { should validate_presence_of(:email) }
  end
end
