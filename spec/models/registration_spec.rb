require 'rails_helper'

RSpec.describe Registration do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:babies) }

  describe '#register' do
		describe 'when a daddy unsuccessfully registers (missing daddy data)' do
			it 'prevents registration' do
        attrs = attributes_for(:registration, city: '', email: nil)

				Registration.new(attrs).register

        expect(User.count).to eq(0)
        expect(Baby.count).to eq(0)
			end
		end

		describe 'when a daddy fails registeration (missing baby data)' do
			it 'prevents registration' do
				babies = [{ first_name: '', gender: :male, birthdate: nil }]
        attrs = attributes_for(:registration, babies: babies)

				Registration.new(attrs).register

        expect(User.count).to eq(0)
        expect(Baby.count).to eq(0)
			end
		end

		describe 'when a daddy successfully registers with one baby' do
			it 'creates a new user and one baby record' do
        attrs = attributes_for(:registration)

				Registration.new(attrs).register

				danelson = User.find_by(first_name: attrs[:first_name])
				child = danelson.babies.find_by(
					first_name: attrs[:babies][0][:first_name]
				)

        expect(User.count).to eq(1)
        expect(Baby.count).to eq(1)
				expect(danelson.babies.count).to eq(1)
				expect(child.first_name).to eq('Junior')
				expect(child.daddy).to eq(danelson)
			end
		end

		describe 'when a daddy successfully registers with two babies' do
			it 'creates a new user and one baby record' do
				attrs = attributes_for(:registration, :multiple_babies)

				Registration.new(attrs).register

				danelson = User.find_by(first_name: attrs[:first_name])
				child1 = danelson.babies.find_by(
					first_name: attrs[:babies][0][:first_name]
				)
				child2 = danelson.babies.find_by(
					first_name: attrs[:babies][1][:first_name]
				)

        expect(User.count).to eq(1)
        expect(Baby.count).to eq(2)
				expect(danelson.babies.count).to eq(2)
				expect(child1.first_name).to eq('Junior')
				expect(child1.daddy).to eq(danelson)
				expect(child2.first_name).to eq('Mariella')
				expect(child2.daddy).to eq(danelson)
			end
		end
  end
end
