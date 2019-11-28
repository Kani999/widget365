module Widgets365
  # Thermometer Sensor evaluator
  class ThermometerSensor
    include Betweenable
    include SensorInitiable

    def evaluate
      dev = standard_deviation
      m = mean

      if (dev <= 3) && between_dispersion?(ref, m, 0.5)
        return { name => 'ultra-precise' }
      elsif (dev <= 5) && between_dispersion?(ref, m, 0.5)
        return { name => 'very precise' }
      else
        return { name => 'precise' }
      end
    end

    protected

    def sum
      values.inject(0) { |accum, i| accum + i }
    end

    def mean
      sum / values.length.to_f
    end

    def sample_variance
      m = mean
      sum = values.inject(0) { |accum, i| accum + (i - m)**2 }
      sum / (values.length - 1).to_f
    end

    def standard_deviation
      Math.sqrt(sample_variance)
    end
  end
end
