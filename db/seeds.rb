# == Daddies and Babies
#
User.destroy_all
Baby.destroy_all
danelson_sr = User.create!(
	email:      'danelson.rosa.sr@gmail.com',
	password:   'dan3lsonS3nior!',
	first_name: 'Danelson',
	city:       'Bronx'
)
_danelson_jr = Baby.create!(
	daddy:			danelson_sr,
	first_name: 'Danelson',
	gender:     :male,
	birthdate:  DateTime.strptime('07/21/2019', "%m/%d/%Y").to_date
)
99.times do
	daddy = User.create!(
		email:      Faker::Internet.unique.email,
		password:   'password',
		first_name: Faker::Name.first_name,
		city:       Faker::Address.city
	)
	num_babies = rand(10)
	num_babies.times do
		Baby.create!(
			daddy:			daddy,
			first_name: Faker::Name.first_name,
			gender:     %i[male female].sample,
			birthdate:  Faker::Date.in_date_period
		)
	end
end
