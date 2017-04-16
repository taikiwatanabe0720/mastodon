# frozen_string_literal: true

class RemovalWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'remove'

  def perform(status_id)
    RemoveStatusService.new.call(Status.find(status_id))
  rescue ActiveRecord::RecordNotFound
    true
  end
end
