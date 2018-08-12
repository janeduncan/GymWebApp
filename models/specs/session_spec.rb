require("minitest/autorun")
require_relative("../session")
require_relative("../instructor")
require_relative("../gymclass")
require_relative("../studio")

class TestSession < MiniTest::Test

  def setup()
    options = {"id" => 1, "class_name" => "Cycle", "description" => "Class description"}
    @gymclass = GymClass.new(options)

    studio = {"studio" => "Spin Studio"}
    @studio = Studio.new(studio)

    instructor = {"id" => 1, "first_name" => "Greg", "last_name" => "Duncan"}
    @instructor = Instructor.new(instructor)

    options = {"id" => 1, "gym_class_id" => @gymclass, "instructor_id" => @instructor.id(), "studio_id" => @studio.id(), "available_spaces" => 12, "class_time" => "09:00:00", "class_date" => "2018-09-01", "duration" => 30, "peak_hours" => false}
    @session = Session.new(options)
  end

  def test_available_spaces()
    result = @session.available_spaces()
    assert_equal(12, result)
  end

  # this test isn't working?
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

  def test_peak_hours()
    result = @session.peak_hours()
    assert_equal(false, result)
  end

end
