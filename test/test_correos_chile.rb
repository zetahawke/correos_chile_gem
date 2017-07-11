require 'minitest/autorun'
require 'correos_chile'

# This test will prove if correos chile website response is what we need
class CorreosChileTest < Minitest::Test
  def test_tracking_search
    assert_equal String,
                 CorreosChile.find('3072766977749').status.class
  end
end
