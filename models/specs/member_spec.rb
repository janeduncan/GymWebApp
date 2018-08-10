require("minitest/autorun")
require_relative("../member")

class TestMember < MiniTest::Test

  def setup()
    options = {"id" => 1, "first_name" => "Jane", "last_name" => "Duncan",
      "email" => "janeduncan@live.co.uk", "phone_number" => "07790556033", "membership_type" => "Premium"}
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

  def test_email()
    result = @member.email()
    assert_equal("janeduncan@live.co.uk", result)
  end

  def test_phone_number()
    result = @member.phone_number()
    assert_equal("07790556033", result)
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
