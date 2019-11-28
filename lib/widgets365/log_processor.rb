module Widgets365
  # Processing log file of widgets into JSON format
  class LogProcessor
    def self.log_to_json(file_path)
      raise 'File not found' unless File.exist?(file_path)

      # keyword for room setting
      room_kw = 'reference'
      thermometer_kw = 'thermometer'
      humidity_kw = 'humidity'
      monoxide_kw = 'monoxide'

      # Type of sensor
      type = nil
      # name of sensor
      name = nil
      # time of logged value
      time = nil
      # value logged by sensor
      value = nil

      # Init arbitrary-depth hashes
      log_hash = Hash.new { |h, k| h[k] = Hash.new(&h.default_proc) }

      file = File.open(file_path, 'r')

      # Go through log line by line
      file.to_a.each do |line|
        # split line by " " to get array of values
        values = line.split(' ')

        # First line contains reference setting
        if values[0] == room_kw
          log_hash[room_kw][thermometer_kw] = values[1]
          log_hash[room_kw][humidity_kw] = values[2]
          log_hash[room_kw][monoxide_kw] = values[3]
          next
        end

        # if the first value isn't date, store type and name of sensor
        unless values[0] =~ /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/
          type = values[0]
          name = values[1]
          next
        end

        # Store time and value from log file
        time = values[0]
        value = values[1]

        # store log values to hash
        log_hash[type][name][time] = value
      end

      file.close

      log_hash.to_json
    end
  end
end
