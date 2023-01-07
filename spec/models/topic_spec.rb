require "rails_helper"

RSpec.describe Topic, type: :model do
  it { should have_many(:comments).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  subject { FactoryBot.create(:topic) }
  it { should validate_uniqueness_of(:name).case_insensitive }
end
