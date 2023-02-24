# frozen_string_literal: true

namespace :question_of_the_days do
  desc "Create initial set of questions"
  task create_first_set: :environment do
    questions = {
      Date.parse("Feb 24, 2023") => "What nicknames do you have for your kids?",
      Date.parse("Feb 25, 2023") => "What was your immediate thought when you found out you were becoming a father for the first time? Nth time?",
      Date.parse("Feb 26, 2023") => "Do you post pics of your children on social media?",
      Date.parse("Feb 27, 2023") => "How do you split the parenting bills?",
      Date.parse("Feb 28, 2023") => "What's it like to be a dad?",
      Date.parse("Mar 01, 2023") => "Have you started to think about how to celebrate Mother's Day and/or Father's Day?",
      Date.parse("Mar 02, 2023") => "What have you given up or temporarily put on hold as a result of having kids? 'Sleep' and 'time' don't count!",
      Date.parse("Mar 03, 2023") => "How many kids do you have compared to the number you thought you wanted?",
      Date.parse("Mar 04, 2023") => "What have you and Mom argued about in the past? E.g. it's bath time and one of you thinks the water is too hot or cold, how many layers to wear outside",
      Date.parse("Mar 05, 2023") => "Do you have a sippy-sip during family events, birthday parties, etc when your kids are there too?",
      Date.parse("Mar 06, 2023") => "What's your favorite book to read to your littles?",
      Date.parse("Mar 07, 2023") => "What's one thing you wish you knew before about parenting/fatherhood that you know now?",
      Date.parse("Mar 08, 2023") => "If you had to describe each kiddo in one sentence or less, what would it be?",
      Date.parse("Mar 09, 2023") => "What's one of the most recent funniest moments?",
      Date.parse("Mar 10, 2023") => "How do birthday parties get planned and organized?",
      Date.parse("Mar 11, 2023") => "Did you wait to find gender in a gender reveal or immediately asked to know the sex?",
      Date.parse("Mar 12, 2023") => "Do you have a favorite? 😈",
      Date.parse("Mar 13, 2023") => "Were you in the delivery room or did you wait outside?",
      Date.parse("Mar 14, 2023") => "What're some of your proudest moments?",
      Date.parse("Mar 15, 2023") => "What resources would you have taken advantage of if they were available or if you knew about them before?",
      Date.parse("Mar 16, 2023") => "What's been your favorite age so far?",
      Date.parse("Mar 17, 2023") => "What's the best thing about about being a dad?",
      Date.parse("Mar 18, 2023") => "Any of your children a prodigy? Or really skilled in something?",
      Date.parse("Mar 19, 2023") => "What's the first solids you gave to your munchkins? How old were they?",
      Date.parse("Mar 20, 2023") => "What's one of the most recent scariest moments?",
      Date.parse("Mar 21, 2023") => "When did your baby first drink water?",
      Date.parse("Mar 22, 2023") => "Do you plan to have more babies?",
      Date.parse("Mar 23, 2023") => "Is your kid a picky eater?",
      Date.parse("Mar 24, 2023") => "What's your kiddos' personality like?",
      Date.parse("Mar 25, 2023") => "Are you the 'disciplinarian' or your partner/someone else is?",
      Date.parse("Mar 26, 2023") => "What do you do when the kids go to bed at night and it's 'Adult Time'?",
      Date.parse("Mar 27, 2023") => "What does your supporting village look like?",
      Date.parse("Mar 28, 2023") => "Did you get a private hospital recovery room or a shared one?",
      Date.parse("Mar 29, 2023") => "What's something you look forward to doing with your kid when they hit certain ages?",
      Date.parse("Mar 30, 2023") => "How much time do you have to put into passion projects and/or side hustles?",
      Date.parse("Mar 31, 2023") => "What does the bedtime routine look like?",
      Date.parse("Apr 01, 2023") => "What does your day-to-day look like?",
      Date.parse("Apr 02, 2023") => "Do your kids sleep in bed with you?",
      Date.parse("Apr 03, 2023") => "What does your village aka support look like?",
      Date.parse("Apr 04, 2023") => "What was the first time traveling like?",
    }
    puts "Going to create #{questions.count} questions:"

    ActiveRecord::Base.transaction do
      questions.each do |day, question|
        QuestionOfTheDay.find_or_create_by!(day: day, question: question)
        print "."
      end
    end

    puts
    puts " All done now!"
  end
end
