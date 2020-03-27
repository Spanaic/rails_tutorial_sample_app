require 'test_helper'

def setup
  @base_title = "Ruby on Rails Tutorial Sample App"
end

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "#{@base_title}"
    assert_equal full_title("Help"), "Help | #{@base_title}"
  end
end