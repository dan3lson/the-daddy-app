require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:replies).dependent(:destroy) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:status) }
  it { should define_enum_for(:status).with_values(%i[active inactive]) }
end
