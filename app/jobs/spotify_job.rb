class TestJob < ApplicationJob
  queue_as :default

  def perform
    # call SpotSearch.something.perform here
  end
end