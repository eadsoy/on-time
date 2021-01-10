class TestJob < ApplicationJob
  queue_as :default

  def perform
    puts "I'm a test job!!"
  end
end
