require 'json'

require 'widgets365/version'
require 'widgets365/log_processor'
require 'widgets365/exceptions'

require 'widgets365/concerns/betweenable'
require 'widgets365/concerns/sensor_initiable'

require 'widgets365/sensor_evaluator'

require 'widgets365/sensors/thermometer_sensor'
require 'widgets365/sensors/humidity_sensor'
require 'widgets365/sensors/monoxide_sensor'

# Sensor classification module for quality identification according to defined rules
module Widgets365 end
