require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutMethods < EdgeCase::Koan

  def method_with_keyword_arguments(one: 1, two: 'two')
    [one, two]
  end

  def test_keyword_arguments
    assert_equal __(Array), method_with_keyword_arguments.class
    assert_equal __([1, 'two']), method_with_keyword_arguments
    assert_equal __(['one', 'two']), method_with_keyword_arguments(one: 'one')
    assert_equal __([1, 2]), method_with_keyword_arguments(two: 2)
  end

  def method_with_keywork_arguments_with_mandatory_argument(one, two: 2, three: 3)
    [one, two, three]
  end

  def test_keyword_arguments_with_wrong_number_of_arguments
    exception = assert_raise (___(ArgumentError)) do
      method_with_keywork_arguments_with_mandatory_argument
    end
    assert_match(/#{__("wrong number of arguments")}/, exception.message)
  end

  # THINK ABOUT IT:
  #
  # Keyword arguments always have a default value, making them optional to the caller

end
