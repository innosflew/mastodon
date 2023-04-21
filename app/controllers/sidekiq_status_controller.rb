 # This file was added by Innos. It creates a Sidekiq status endpoint at https://example.com/sidekiq_status to check the health of Sidekiq. The routing is provided by a line in the "config/routes.rb" file
class SidekiqStatusController < ApplicationController
    def show
      if Sidekiq::ProcessSet.new.size > 0
        render json: { status: 'alive' }, status: :ok
      else
        render json: { status: 'dead' }, status: :service_unavailable
      end
    end
  end