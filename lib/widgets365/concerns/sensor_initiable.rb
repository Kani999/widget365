# Initializer for sensors
module SensorInitiable
  attr_accessor :ref, :name, :values

  # ref = the reference value for sensor
  # name = name of the thermometer sensor
  # values = array of measured degrees
  def initialize(ref, name, values)
    self.ref = ref
    self.name = name
    self.values = values

    if self.ref.nil? || self.name.nil? || self.values.nil?
      raise Widgets365::SensorNotInitializedError
    end
  end
end
