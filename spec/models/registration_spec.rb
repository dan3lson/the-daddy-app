require 'rails_helper'

RSpec.describe Registration do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:babies) }

  describe '#register' do
		describe 'when a daddy unsuccessfully registers (invalid daddy data)' do
			it 'prevents registration' do
				attrs = {
					email: 'danelson.rosa.sr@gmail.com',
					password: 'password',
					first_name: '',
					city: '',
					babies: [
						{
							first_name: 'Junior',
							gender: :male,
							birthdate: '2019/07/21'
						}
					]
				}

				Registration.new(attrs).register

        expect(User.count).to eq(0)
        expect(Baby.count).to eq(0)
			end
		end

		describe 'when a daddy fails registeration (invalid baby data)' do
			it 'prevents registration' do
				attrs = {
					email: 'danelson.rosa.sr@gmail.com',
					password: 'password',
					first_name: 'Danelson',
					city: 'New York',
					babies: [
						{
							first_name: '',
							gender: :male,
							birthdate: ''
						}
					]
				}

				Registration.new(attrs).register

        expect(User.count).to eq(0)
        expect(Baby.count).to eq(0)
			end
		end

		describe 'when a daddy fails registeration (invalid baby data (partial))' do
			it 'prevents registration' do
				attrs = {
					email: 'bigdaddyd8688@yahoo.com',
					password: 'password',
					first_name: 'Danelson',
					city: 'New York',
					babies: [
						{
							first_name: 'Danelson',
							gender: nil,
							birthdate: '2019/07/21'
						},
						{
							first_name: 'Mariella',
							gender: '',
							birthdate: nil
						}
					]
				}

				Registration.new(attrs).register

        expect(User.count).to eq(0)
        expect(Baby.count).to eq(0)
			end
		end

		describe 'when a daddy successfully registers with one baby' do
			it 'creates a new user and one baby record' do
				attrs = {
					email: 'danelson.rosa.sr@gmail.com',
					password: 'password',
					first_name: 'Danelson',
					city: 'New York',
					babies: [
						{
							first_name: 'Junior',
							gender: :male,
							birthdate: '2019/07/21'
						}
					]
				}

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
				attrs = {
					email: 'danelson.rosa.sr@gmail.com',
				  password: 'password',
				  first_name: 'Danelson',
				  city: 'New York',
					babies: [
						{
							first_name: 'Junior',
							gender: :male,
							birthdate: '2019/07/21'
						},
						{
							first_name: 'Mariella',
							gender: :female,
							birthdate: '2021/07/02'
						}
					]
				}

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
