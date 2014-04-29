require 'test/unit'
require_relative '../alarm'

class AlarmTest < Test::Unit::TestCase
  def test_alarm_is_off_after_it_initialized
    alarm = Alarm.new
    assert_equal false, alarm.alarm_on
  end
end