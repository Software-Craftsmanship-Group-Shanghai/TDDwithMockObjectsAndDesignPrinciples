require_relative './sensor'

class Alarm

  attr_reader :alarm_on

  def initialize sensor=Sensor.new
    @sensor = sensor
    @alarm_on = false
  end

  def check
    pressure = @sensor.pop_next_pressure_psi_value()

    @alarm_on = true if pressure < LOW_PRESSURE || HIGH_PRESSURE < pressure
  end

  def on
    @alarm_on = true
  end

  def off
    @alarm_on = false
  end

  def is_alarm_on
    return @alarm_on
  end

private

  LOW_PRESSURE = 17
  HIGH_PRESSURE = 21
end
