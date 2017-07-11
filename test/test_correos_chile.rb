require 'minitest/autorun'
require 'correos_chile'

# This test will prove if correos chile website response is what we need
class CorreosChileTest < Minitest::Test
  def test_tracking_search
    assert_equal String,
                 CorreosChile.search_order('999010461678').status.class
  end
end
