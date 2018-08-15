require("minitest/autorun")
require_relative("../membership")

class TestMembership < MiniTest::Test

  def setup()
    options = {"type" => "Standard"}
    @membership = Membership.new(options)
  end

  def test_membership_type()
    result = @membership.type()
    assert_equal("Standard", result)
  end
  def test_if_membership_is_active()
    result = @membership.active()
    assert_equal(true, result)
  end

end
