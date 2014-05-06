require_relative './sensor'
require_relative './alarm'

class Policy
  def initialize sensor, alarm
    @sensor = sensor
    @alarm = alarm
  end
end
