module Widgets365
    class InvalidFileSpecifiedError < StandardError
        def initialize
          super("Input file does seems to be in correct log format")
        end
    end

    class SensorNotInitializedError < StandardError
        def initialize
          super("All attributes must be initialized")
        end
    end
end