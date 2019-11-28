module Widgets365
  # Monoxide Sensor evaluator
  class MonoxideSensor
    include Betweenable
    include SensorInitiable

    def evaluate
      # must be discarded unless all inputs aren't in 3 ppm of the reference val
      if between_dispersion?(values, ref, 3)
        { name => 'keep' }
      else
        { name => 'discard' }
      end
    end
  end
end
