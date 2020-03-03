require 'rails_helper'

RSpec.describe Baby, type: :model do
  it { should belong_to(:daddy) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:gender) }
  it { should define_enum_for(:gender).with_values(%i[male female]) }
  it { should validate_presence_of(:birthdate) }

  describe '#humanize_gender' do
    context 'when a daddy has a male baby' do
      it "converts the gender to read 'boy'" do
        baby = create(:baby)

        expect(baby.humanize_gender).to eq('boy')
      end
    end

    context 'when a daddy has a female baby' do
      it "converts the gender to read 'girl'" do
        baby = create(:baby, :female)

        expect(baby.humanize_gender).to eq('girl')
      end
    end
  end
end
