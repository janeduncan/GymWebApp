require('pry')
require_relative("../models/booking")
require_relative("../models/gymclass")
require_relative("../models/member")
require_relative("../models/instructor")
require_relative("../models/studio")
require_relative("../models/session")
require_relative("../models/membership")

Booking.delete_all()
Session.delete_all()
GymClass.delete_all()
Instructor.delete_all()
Member.delete_all()
Studio.delete_all()
Membership.delete_all()

# Membership


# Studios

studio1 = Studio.new({ "studio" => "SPIN Studio"})
studio2 = Studio.new({ "studio" => "Gym Floor"})
studio3 = Studio.new({ "studio" => "Studio 1"})
studio1.save()
studio2.save()
studio3.save()

# Members

member1 = Member.new({ "first_name" => "Jane", "last_name" => "Duncan", "membership_type" => "Premium" })
member2 = Member.new({ "first_name" => "Kirsty", "last_name" => "Bruce", "membership_type" => "Standard" })
member3 = Member.new({ "first_name" => "Craig", "last_name" => "Bowditch", "membership_type" => "Premium" })
member4 = Member.new({ "first_name" => "Andrew", "last_name" => "Craigie", "membership_type" => "Standard" })
member5 = Member.new({ "first_name" => "Connie", "last_name" => "Leighton", "membership_type" => "Premium" })
member6 = Member.new({ "first_name" => "Fiona", "last_name" => "Wilson", "membership_type" => "Standard" })
member7 = Member.new({ "first_name" => "Ricky", "last_name" => "Corrigan", "membership_type" => "Premium" })
member8 = Member.new({ "first_name" => "Shannon", "last_name" => "Holmes", "membership_type" => "Standard" })
member9 = Member.new({ "first_name" => "Pim", "last_name" => "Groenveld", "membership_type" => "Premium" })
member10 = Member.new({ "first_name" => "Sithara", "last_name" => "Sukumar", "membership_type" => "Standard" })
member11 = Member.new({ "first_name" => "Fraser", "last_name" => "Douglas", "membership_type" => "Premium" })
member12 = Member.new({ "first_name" => "Yingying", "last_name" => "Chen", "membership_type" => "Standard" })
member13 = Member.new({ "first_name" => "Anne", "last_name" => "Ince", "membership_type" => "Premium" })
member14 = Member.new({ "first_name" => "Tanny", "last_name" => "Quereshi", "membership_type" => "Standard" })
member15 = Member.new({ "first_name" => "Rameez", "last_name" => "Tariq", "membership_type" => "Premium" })
member16 = Member.new({ "first_name" => "Robert", "last_name" => "Deignan", "membership_type" => "Standard" })
member17 = Member.new({ "first_name" => "Kaspars", "last_name" => "Dzerins", "membership_type" => "Premium" })
member18 = Member.new({ "first_name" => "Christian", "last_name" => "Geib", "membership_type" => "Standard" })
member19 = Member.new({ "first_name" => "Ally", "last_name" => "McGilloway", "membership_type" => "Premium" })
member20 = Member.new({ "first_name" => "Upul", "last_name" => "Dissanayaka", "membership_type" => "Standard" })
member21 = Member.new({ "first_name" => "Alistair", "last_name" => "Kane", "membership_type" => "Premium" })
member22 = Member.new({ "first_name" => "Alan", "last_name" => "Russell", "membership_type" => "Standard" })
member1.save()
member2.save()
member3.save()
member4.save()
member5.save()
member6.save()
member7.save()
member8.save()
member9.save()
member10.save()
member11.save()
member12.save()
member13.save()
member14.save()
member15.save()
member16.save()
member17.save()
member18.save()
member19.save()
member20.save()
member21.save()
member22.save()

# Instructors

instructor1 = Instructor.new({ "first_name" => "Patrick", "last_name" => "Bateman" })
instructor2 = Instructor.new({ "first_name" => "Michael", "last_name" => "Scott" })
instructor3 = Instructor.new({ "first_name" => "Ron", "last_name" => "Swanson" })
instructor1.save()
instructor2.save()
instructor3.save()

# Classes

class1 = GymClass.new({ "class_name" => "Cycle", "description" => "Description of class." })
class2 = GymClass.new({ "class_name" => "Circuits", "description" => "Description of class." })
class3 = GymClass.new({ "class_name" => "Abs", "description" => "Description of class." })
class4 = GymClass.new({ "class_name" => "Fat Burn", "description" => "Description of class." })
class5 = GymClass.new({ "class_name" => "Pilates", "description" => "Description of class." })
class1.save()
class2.save()
class3.save()
class4.save()
class5.save()

# Sessions

session1 = Session.new({ "gymclass_id" => class1.id(), "instructor_id" => instructor1.id(), "studio_id" => studio1.id(), "available_spaces" => 15, "class_time" => "07:30:00", "class_date" => "2018-09-01", "duration" => 30, "peak_hours" => true })

session2 = Session.new({ "gymclass_id" => class2.id(), "instructor_id" => instructor2.id(), "studio_id" => studio2.id(), "available_spaces" => 12, "class_time" => "09:00:00", "class_date" => "2018-09-02", "duration" => 30, "peak_hours" => true })

session3 = Session.new({ "gymclass_id" => class3.id(), "instructor_id" => instructor3.id(), "studio_id" => studio3.id(), "available_spaces" => 10, "class_time" => "13:00:00", "class_date" => "2018-09-03", "duration" => 30, "peak_hours" => false })

session4 = Session.new({ "gymclass_id" => class4.id(), "instructor_id" => instructor2.id(), "studio_id" => studio2.id(), "available_spaces" => 12, "class_time" => "18:30:00", "class_date" => "2018-09-04", "duration" => 30, "peak_hours" => true })

session5 = Session.new({ "gymclass_id" => class5.id(), "instructor_id" => instructor1.id(), "studio_id" => studio3.id(), "available_spaces" => 8, "class_time" => "15:00:00", "class_date" => "2018-09-05", "duration" => 30, "peak_hours" => false })
session1.save()
session2.save()
session3.save()
session4.save()
session5.save()

# Bookings

booking1 = Booking.new({ "member_id" => member1.id(), "session_id" => session1.id() })
booking6 = Booking.new({ "member_id" => member20.id(), "session_id" => session1.id() })
booking2 = Booking.new({ "member_id" => member2.id(), "session_id" => session2.id() })
booking3 = Booking.new({ "member_id" => member3.id(), "session_id" => session3.id() })
booking4 = Booking.new({ "member_id" => member4.id(), "session_id" => session4.id() })
booking5 = Booking.new({ "member_id" => member5.id(), "session_id" => session5.id() })
booking1.save()
booking2.save()
booking3.save()
booking4.save()
booking5.save()
booking6.save()

binding.pry
nil
