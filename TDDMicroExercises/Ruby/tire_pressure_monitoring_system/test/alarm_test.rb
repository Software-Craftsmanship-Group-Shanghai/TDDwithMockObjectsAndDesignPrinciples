require 'test/unit'
require_relative '../alarm'
require_relative '../sensor'

class MockSensor

  attr_writer :psi_value

	def initialize psi_value
		@psi_value = psi_value
	end

	def pop_next_pressure_psi_value
		@psi_value
	end
end

class AlarmTest < Test::Unit::TestCase

  def setup
    @sensor = MockSensor.new(0)
    @alarm = Alarm.new(@sensor)
  end

  def test_alarm_is_off_after_it_initialized
    assert_equal false, @alarm.alarm_on
  end

  def test_alarm_is_on_when_pressure_lesser_than_range
    @sensor.psi_value = 16
    @alarm.check
    assert_equal true, @alarm.alarm_on
  end

  def test_alarm_is_on_when_pressure_exceed_range
    @sensor.psi_value = 22
    @alarm.check
    assert_equal true, @alarm.alarm_on
  end

  def test_alarm_is_off_when_pressure_within_range
    @sensor.psi_value = 20
    @alarm.check
    assert_equal false, @alarm.alarm_on
  end

  def test_alarm_is_on_when_pressure_back_within_range
    @sensor.psi_value = 22
    @alarm.check
    @sensor.psi_value = 20

    @alarm.check

    assert_equal true, @alarm.alarm_on
  end

end
