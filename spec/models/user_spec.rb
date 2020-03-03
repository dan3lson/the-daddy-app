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

  describe '#baby_names' do
    context 'when a daddy has one baby' do
      it 'shows one name' do
        daddy = create(:daddy_with_babies)

        expect(daddy.baby_names).to eq('Danelson Jr.')
      end
    end

    context 'when a daddy has two babies' do
      it "shows two names joined by an 'and'" do
        daddy = create(:daddy_with_babies)
        create(:baby, first_name: 'Mariella', daddy: daddy)

        expect(daddy.baby_names).to eq('Danelson Jr. and Mariella')
      end
    end

    context 'when a daddy has three or more babies' do
      it 'shows baby names separated by a comma' do
        daddy = create(:daddy_with_babies)
        create(:baby, first_name: 'Mariella', daddy: daddy)
        create(:baby, first_name: 'Dalivia',  daddy: daddy)

        expect(daddy.baby_names).to eq('Danelson Jr., Mariella, and Dalivia')
      end
    end
  end
end
