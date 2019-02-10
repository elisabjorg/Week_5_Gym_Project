require_relative( "../models/lesson.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/booking.rb" )
require("pry-byebug")

# Booking.delete_all()
Member.delete_all()
# Lesson.delete_all()

  member_1 = Member.new({
    "first_name" => "Sara",
    "last_name" => "Larsen",
    "address" => "George Street",
    "email" => "sara@gmail.com"
    })

  member_1.save()

  member_2 = Member.new({
    "first_name" => "George",
    "last_name" => "Clooney",
    "address" => "Royal Mile",
    "email" => "clooneymachine@gmail.com"
    })

  member_2.save()

  member_3 = Member.new({
    "first_name" => "Brad",
    "last_name" => "Pitt",
    "address" => "Princess Street",
    "email" => "sara@gmail.com"
  })

  member_3.save()

  lesson_1 = Lesson.new({
    "title" => "Fitness Box",
    "instructor" => "Lauren Hill",
  })

  lesson_1.save()

  lesson_2 = Lesson.new({
    "title" => "Cycle",
    "instructor" => "Jerry Seinfeld",
  })

  lesson_2.save()

  lesson_3 = Lesson.new({
    "title" => "Pilates",
    "instructor" => "Julia Roberts",
  })

  lesson_3.save()
