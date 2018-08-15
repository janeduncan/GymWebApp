require("minitest/autorun")
require_relative("../gymclass")

class TestGymClass < MiniTest::Test

  def setup()
    options = {"id" => 1, "class_name" => "Cycle", "description" => "Class description"}
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

end
