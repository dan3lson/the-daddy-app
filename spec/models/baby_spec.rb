require 'rails_helper'

RSpec.describe Baby, type: :model do
  it { should belong_to(:daddy) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:gender) }
  it { should define_enum_for(:gender).with_values(%i[male female]) }
  it { should validate_presence_of(:birthdate) }
end
