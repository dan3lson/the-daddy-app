require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:babies).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should validate_presence_of(:email) }
  subject { FactoryBot.create(:user) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:city) }
end
