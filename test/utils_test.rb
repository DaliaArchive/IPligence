require_relative "test_helper"

class UtilsTest < MiniTest::Test

  def test_convert_dotted_to_long
    assert_equal(3232235521, Ipligence::Utils.convert_dotted_to_long("192.168.0.1"))
    assert_equal(514, Ipligence::Utils.convert_dotted_to_long("0.0.2.2"))
    assert_equal(0, Ipligence::Utils.convert_dotted_to_long("0.0.0.0"))
    assert_equal(4294967295, Ipligence::Utils.convert_dotted_to_long("255.255.255.255"))
  end

end