# frozen_string_literal: true

# == Seed Helpers
#
def new_sentence
  Faker::Lorem.sentences(number: rand(1..5)).join(" ")
end

def new_question
  Faker::Lorem.question
end

# == Questions of the Day
#

days = (Date.current - 2.weeks..Date.current.next_month).to_a
days.each { |day| QuestionOfTheDay.create!(question: new_question, day: day) }

# == Daddies and Children
#
User.destroy_all
danelson_sr = User.create!(
  admin: true,
  email: "danelson.rosa.sr@gmail.com",
  password: "password",
  first_name: "Danelson",
  city: "Bronx"
)
_danelson_jr = Child.create!(
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
  num_children = rand(10)
  num_children.times do
    Child.create!(
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
  "➕" => "plus",
  "❤️" => "red-heart",
  "👍" => "thumbs-up-default"
}.freeze
EMOJIS.each { |emoji, name| Emoji.find_or_create_by!(emoji: emoji, name: name) }
plus_emoji = Emoji.plus_emoji
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

# == Feedbacks
#
rand(10..20).times do |i|
  feedback = Feedback.create!(
    body: [new_sentence, new_question].sample,
    kind: :feature_request,
    user: users.sample
  )
  feedback.reactions.create!(emoji: plus_emoji, user: users.sample) if [true, false].sample
end
