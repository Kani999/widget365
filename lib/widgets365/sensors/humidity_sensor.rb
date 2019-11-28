module Widgets365
  # Humidity Sensor evaluator
  class HumiditySensor
    include Betweenable
    include SensorInitiable

    def evaluate
      # each value has to be in range to reference value witihin 1%
      if between_dispersion?(values, ref, ref / 100)
        { name => 'keep' }
      else
        { name => 'discard' }
      end
    end
  end
end
