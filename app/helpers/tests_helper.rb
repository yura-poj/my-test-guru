module TestsHelper
  TEST_LEVELS = {0 => :easy, 1 => :elementary, 2 => :advanced, 3 => :hard, 4 => :hero}.freeze

  def test_level(test)
    TEST_LEVELS[test.level]
  end
end
