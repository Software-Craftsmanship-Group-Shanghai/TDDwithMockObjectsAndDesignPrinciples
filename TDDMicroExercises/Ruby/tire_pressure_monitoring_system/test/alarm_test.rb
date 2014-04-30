require 'test/unit'
require_relative '../alarm'
require_relative '../sensor'

class MockSensor < Sensor
	def initialize psi_value
		@psi_value = psi_value
	end

	def pop_next_pressure_psi_value
		@psi_value
	end
end

class AlarmTest < Test::Unit::TestCase
  def test_alarm_is_off_after_it_initialized
    alarm = Alarm.new
    assert_equal false, alarm.alarm_on
  end

  def test_alarm_is_on_when_pressure_out_of_range
    alarm = Alarm.new
    alarm.sensor = MockSensor.new(10)

    alarm.check

    assert_equal true, alarm.alarm_on  	
  end

  def test_alarm_is_off_when_pressure_within_range
    alarm = Alarm.new
    alarm.sensor = MockSensor.new(20)

    alarm.check

    assert_equal false, alarm.alarm_on  	
  end

end