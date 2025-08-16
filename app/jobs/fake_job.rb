class FakeJob < ApplicationJob
  queue_as :default

  def perform
    # API call
    # Sending email
    # Cleaning up database...
    puts "Starting to fetch API...."
    sleep 3
    puts "Response received"
  end
end
