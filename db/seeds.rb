require_relative( "../models/lesson.rb" )
require_relative( "../models/member.rb" )
require_relative( "../models/booking.rb" )
require("pry")

Booking.delete_all()
Member.delete_all()
Lesson.delete_all()

  member_1 = Member.new({
    "first_name" => "Sara",
    "last_name" => "Larsen",
    "address" => "22 George Street",
    "email" => "sara@gmail.com"
    })

  member_1.save()

  member_2 = Member.new({
    "first_name" => "George",
    "last_name" => "Clooney",
    "address" => "15 Royal Mile",
    "email" => "clooneymachine@gmail.com"
    })

  member_2.save()

  member_3 = Member.new({
    "first_name" => "Brad",
    "last_name" => "Pitt",
    "address" => "3 Princess Street",
    "email" => "sara@gmail.com"
  })

  member_3.save()

  member_4 = Member.new({
    "first_name" => "Jennifer",
    "last_name" => "Aniston",
    "address" => "101 Princess Garden",
    "email" => "jennifer@gmail.com"
  })

  member_4.save()

  lesson_1 = Lesson.new({
    "title" => "Fitness Box",
    "instructor" => "Lauren Hill"
  })

  lesson_1.save()

  lesson_2 = Lesson.new({
    "title" => "Cycle",
    "instructor" => "Jerry Seinfeld"
  })

  lesson_2.save()

  lesson_3 = Lesson.new({
    "title" => "Pilates",
    "instructor" => "Julia Roberts"
  })

  lesson_3.save()

  lesson_4 = Lesson.new({
    "title" => "Hot Yoga",
    "instructor" => "Jay Leno"
  })

  lesson_4.save()

  booking_1 = Booking.new({
    "member_id" => member_1.id,
    "lesson_id" => lesson_1.id
    })

  booking_1.save()

  booking_2 = Booking.new({
    "member_id" => member_2.id,
    "lesson_id" => lesson_2.id
    })

  booking_2.save()

  booking_3 = Booking.new({
    "member_id" => member_3.id,
    "lesson_id" => lesson_3.id
    })

  booking_3.save()

  booking_4 = Booking.new({
    "member_id" => member_2.id,
    "lesson_id" => lesson_1.id
    })

  booking_4.save()



binding.pry
nil
