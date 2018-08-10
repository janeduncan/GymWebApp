require("minitest/autorun")
require_relative("../gym_class")
require_relative("../instructor")

class TestGymClass < MiniTest::Test

  def setup()
    instructor = {"id" => 1, "first_name" => "Greg", "last_name" => "Duncan",
      "email" => "greg@gitpumped.co.uk", "phone_number" => "07890666235"}
    @instructor = Instructor.new(instructor)

    options = {"id" => 1, "class_name" => "Cycle", "description" => "Class description", "instructor" => @instructor, "capacity" => 12, "class_time" => "09:00:00", "class_date" => "2018-09-01", "duration" => 30}
    @gymclass = GymClass.new(options)
  end

  def test_class_name()
    result = @gymclass.class_name()
    assert_equal("Cycle", result)
  end

  def test_description()
    result = @gymclass.description()
    assert_equal("Class description", result)
  end

  def test_instructor()
    result = @gymclass.instructor()
    assert_equal(@instructor, result)
  end

  def test_capacity()
    result = @gymclass.capacity()
    assert_equal(12, result)
  end

  def test_class_time()
    result = @gymclass.class_time()
    assert_equal("09:00:00", result)
  end

  def test_class_time()
    result = @gymclass.class_date()
    assert_equal("2018-09-01", result)
  end

  def test_duration()
    result = @gymclass.duration()
    assert_equal(30, result)
  end

end
