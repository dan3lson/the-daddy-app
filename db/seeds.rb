# == Seed Helpers
#
def new_sentence
	Faker::Lorem.sentences(number: rand(1..5)).join(' ')
end

def new_question
	Faker::Lorem.question
end

# == Daddies and Babies
#
User.destroy_all
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
5.times do
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

# == Topics
#
Topic.destroy_all
topics = %w[sleep purchases food relationships money]
topics.each { |name| Topic.create!(name: name) }

# == Comments
#
User.all.each do |user|
	topic    = Topic.all.sample
	replier  = User.all.sample
	body     = [new_sentence, new_question].sample
	comment  = Comment.create!(body: body, topic: topic, user: User.all.sample)
	rand(10).times do
		comment.replies.create!(
			body: new_sentence,
			topic: comment.topic,
			user: replier
		)
	end
end
