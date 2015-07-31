require "minitest/unit"
require "minitest/autorun"
require "./helper"

class TestConstant < MiniTest::Unit::TestCase
  def setup
    @bs = gen_bridge_metadata("define.h", {:cflags => "-D__DEF_FOO__"})
  end

  def test_stringconstant
    const = @bs["string_constant"]

    assert_equal(const[0]["name"],  "FOO")
    assert_equal(const[0]["value"], "hello, foo")
  end

end