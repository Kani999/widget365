# Widgets365

## Usage

```
docker build -t widget365 .
docker run -it --entrypoint /bin/bash widget365

# In docker container
# Run code with default log file stored in data/365_widget.log
bin/widget365 

# Or pass path to a log file
bin/widget365 "path/to/log/file"
```
