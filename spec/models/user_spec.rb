require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  subject { FactoryBot.create(:user) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:city) }
end
