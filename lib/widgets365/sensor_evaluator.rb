module Widgets365
  # Evaluate the quality of sensors
  class SensorEvaluator
    attr_accessor :log_file

    def initialize(log_file)
      self.log_file = log_file
    end

    def evaluate_devices
      # Convert log file into JSON representation
      json_log = JSON.parse(LogProcessor.log_to_json(log_file))

      # Reference settings
      references = load_reference(json_log.fetch('reference'))

      # Sensor types = thermometer, humidity, etc. with their names and values
      sensors = json_log.reject { |k| k == 'reference' }

      sensors_result = {}

      sensors.keys.each do |type|
        evaluated_type = evaluate_sensor_type(type, sensors, references)
        sensors_result.merge!(evaluated_type)
      end

      sensors_result
    end

    protected

    # ref_json = json of all reference values load from log file
    def load_reference(ref_json)
      references = {}

      # degrees as float
      references['thermometer'] = ref_json['thermometer'].to_f
      # humidity percentage as float
      references['humidity'] = ref_json['humidity'].to_f
      # monoxide ppm as integer
      references['monoxide'] = ref_json['monoxide'].to_i

      references
    end

    # type = type of sensor thermometer, humidity, ...
    # sensors = sensors names with values from logfile represented as json
    # references = reference values
    def evaluate_sensor_type(type, sensors, references)
      result = {}
      sensor_names = sensors.fetch(type)

      case type
      when 'thermometer'
        sensor_names.keys.each do |name|
          sensor = ThermometerSensor.new(references[type],
                                         name,
                                         sensor_names[name].values.map(&:to_f))
                                    .evaluate

          result.merge!(sensor)
        end
        return result
      when 'humidity'
        sensor_names.keys.each do |name|
          sensor = HumiditySensor.new(references[type],
                                      name,
                                      sensor_names[name].values.map(&:to_f))
                                 .evaluate
          result.merge!(sensor)
        end
        return result
      when 'monoxide'
        sensor_names.keys.each do |name|
          sensor = MonoxideSensor.new(references[type],
                                      name,
                                      sensor_names[name].values.map(&:to_f))
                                 .evaluate
          result.merge!(sensor)
        end
        return result
      end
    end
  end
end
