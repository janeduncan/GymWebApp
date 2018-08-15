require("minitest/autorun")
require_relative("../studio")

class TestBooking < MiniTest::Test

  def setup()
    options = {"studio" => "Studio 1"}
    @studio = Studio.new(options)
  end

  def test_first_name()
    result = @studio.studio()
    assert_equal("Studio 1", result)
  end

end
