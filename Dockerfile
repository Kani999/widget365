# Use an official Python runtime as a parent image
FROM ruby:2.6

# Set the working directory to /widget365
WORKDIR /widget365

# Copy the current directory contents into the container at /widget365
ADD . /widget365

# Install any needed packages specified in requirements.txt
RUN gem install bundler
RUN bundle install

# Make port 80 available to the world outside this container
# EXPOSE 22

# Run app.py when the container launches
CMD ["ruby", "bin/widget365"]
