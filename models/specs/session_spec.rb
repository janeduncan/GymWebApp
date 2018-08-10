require("minitest/autorun")
require_relative("../session")
require_relative("../instructor")
require_relative("../gym_class")

class TestSession < MiniTest::Test

  def setup()
    options = {"id" => 1, "class_name" => "Cycle", "description" => "Class description"}
    @gymclass = GymClass.new(options)

    instructor = {"id" => 1, "first_name" => "Greg", "last_name" => "Duncan"}
    @instructor = Instructor.new(instructor)

    options = {"id" => 1, "gym_class_id" => @gymclass, "instructor_id" => @instructor.id(), "available_spaces" => 12, "class_time" => "09:00:00", "class_date" => "2018-09-01", "duration" => 30}
    @session = Session.new(options)
  end

  def test_available_spaces()
    result = @session.available_spaces()
    assert_equal(12, result)
  end

  def test_class_time()
    result = @session.class_time()
    assert_equal("09:00:00", result)
  end

  def test_class_time()
    result = @session.class_date()
    assert_equal("2018-09-01", result)
  end

  def test_duration()
    result = @session.duration()
    assert_equal(30, result)
  end

end
