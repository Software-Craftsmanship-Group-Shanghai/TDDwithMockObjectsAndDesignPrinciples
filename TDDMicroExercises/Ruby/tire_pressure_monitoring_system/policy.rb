require_relative './sensor'
require_relative './alarm'

class Policy
  def initialize sensor, alarm
    @sensor = sensor
    @alarm = alarm
  end

  def detect
    pressure = @sensor.pop_next_pressure_psi_value()
    if pressure < LOW_PRESSURE || HIGH_PRESSURE < pressure
      @alarm.on()
    end
  end

private
  LOW_PRESSURE = 17
  HIGH_PRESSURE = 21

end
