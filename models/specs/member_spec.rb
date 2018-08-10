require("minitest/autorun")
require_relative("../member")

class TestMember < MiniTest::Test

  def setup()
    options = {"id" => 1, "first_name" => "Jane", "last_name" => "Duncan", "membership_type" => "Premium"}
    @member = Member.new(options)
  end

  def test_first_name()
    result = @member.first_name()
    assert_equal("Jane", result)
  end

  def test_last_name()
    result = @member.last_name()
    assert_equal("Duncan", result)
  end

  def test_membership_type()
    result = @member.membership_type()
    assert_equal("Premium", result)
  end

  def test_full_name()
    result = @member.full_name()
    assert_equal("Jane Duncan", result)
  end

end
