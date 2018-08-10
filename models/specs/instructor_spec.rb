require("minitest/autorun")
require_relative("../instructor")

class TestInstructor < MiniTest::Test

  def setup()
    options = {"id" => 1, "first_name" => "Greg", "last_name" => "Duncan"}
    @instructor = Instructor.new(options)
  end

  def test_first_name()
    result = @instructor.first_name()
    assert_equal("Greg", result)
  end

  def test_last_name()
    result = @instructor.last_name()
    assert_equal("Duncan", result)
  end

  def test_full_name()
    result = @instructor.full_name()
    assert_equal("Greg Duncan", result)
  end

end
