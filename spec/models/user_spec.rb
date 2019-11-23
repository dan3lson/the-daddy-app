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
    it 'should show one baby name' do
      daddy = create(:daddy_with_babies)
      expect(daddy.baby_names).to eq('Danelson Jr.')
      end

    it 'should show two baby names' do
      daddy = create(:daddy_with_babies)
      create(:baby, first_name: 'Mariella', daddy: daddy)
      expect(daddy.baby_names).to eq('Danelson Jr. and Mariella')
    end

    it 'should show three baby names' do
      daddy = create(:daddy_with_babies)
      create(:baby, first_name: 'Mariella', daddy: daddy)
      create(:baby, first_name: 'Dalivia',  daddy: daddy)
      expect(daddy.baby_names).to eq('Danelson Jr., Mariella, and Dalivia')
    end
  end
end
