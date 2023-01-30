# frozen_string_literal: true

# == Seed Helpers
#
def new_sentence
  Faker::Lorem.sentences(number: rand(1..5)).join(" ")
end

def new_question
  Faker::Lorem.question
end

# == Daddies and Babies
#
User.destroy_all
danelson_sr = User.create!(
  admin: true,
  email: "danelson.rosa.sr@gmail.com",
  password: "password",
  first_name: "Danelson",
  city: "Bronx"
)
_danelson_jr = Baby.create!(
  daddy:	danelson_sr,
  first_name: "Danelson",
  gender: :male,
  birthdate: DateTime.strptime("07/21/2019", "%m/%d/%Y").to_date
)
5.times do
  daddy = User.create!(
    email: Faker::Internet.unique.email,
    password: "password",
    first_name: Faker::Name.first_name,
    city: Faker::Address.city
  )
  num_babies = rand(10)
  num_babies.times do
    Baby.create!(
      daddy: daddy,
      first_name: Faker::Name.first_name,
      gender: %i[male female].sample,
      birthdate: Faker::Date.in_date_period
    )
  end
end

# == Emojis
#
EMOJIS = {
  "👍" => "thumbs-up-default",
  "❤️" => "red-heart"
}.freeze
EMOJIS.each { |emoji, name| Emoji.find_or_create_by!(emoji: emoji, name: name) }
thumbs_up_emoji = Emoji.like_emoji

# == Comments
#
users = User.all
users.count.times do
  body = [new_sentence, new_question].sample
  comment = Comment.create!(body: body, user: users.sample)
  comment.reactions.create!(emoji: thumbs_up_emoji, user: users.sample) if [true, false].sample
  rand(10).times do
    comment.replies.create!(
      body: new_sentence,
      user: users.sample
    )
  end
end
