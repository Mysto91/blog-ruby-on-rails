class GiveCurrentDateJob
  include Sidekiq::Job

  def perform
    puts 'la date du jour en décalée'
  end
end
