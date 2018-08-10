require("minitest/autorun")
require_relative("../instructor")

class TestInstructor < MiniTest::Test

  def setup()
    options = {"id" => 1, "first_name" => "Greg", "last_name" => "Duncan",
      "email" => "greg@gitpumped.co.uk", "phone_number" => "07890666235"}
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

  def test_email()
    result = @instructor.email()
    assert_equal("greg@gitpumped.co.uk", result)
  end

  def test_phone_number()
    result = @instructor.phone_number()
    assert_equal("07890666235", result)
  end

  def test_full_name()
    result = @instructor.full_name()
    assert_equal("Greg Duncan", result)
  end

end
