class FakeJob < ApplicationJob
  queue_as :default

  def perform
    puts "hey"
    sleep 3
    puts 'yo'
  end
end
