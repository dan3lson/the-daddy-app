require 'rails_helper'

RSpec.describe Baby, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:gender) }
  it { should validate_presence_of(:birthdate) }
end
