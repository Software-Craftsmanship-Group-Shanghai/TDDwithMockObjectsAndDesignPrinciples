require 'test/unit'
require_relative '../alarm'
require_relative '../sensor'
require_relative '../policy'

class MockSensor

  attr_writer :psi_value

	def initialize psi_value
		@psi_value = psi_value
	end

	def pop_next_pressure_psi_value
		@psi_value
	end
end

class PolicyTest < Test::Unit::TestCase

  def setup
    @sensor = MockSensor.new(0)
    @alarm = Alarm.new(@sensor)
    @policy = Policy.new(@sesor, @alarm)
  end

  def test_alarm_is_off_after_policy_initialized
    assert_equal false, @alarm.is_alarm_on()
  end

  def test_alarm_is_on_after_pressure_exceeds_high_pressure
    @sensor.psi_value = 30
    @policy.detect
    assert_equal true, @alarm.is_alarm_on
  end


end
