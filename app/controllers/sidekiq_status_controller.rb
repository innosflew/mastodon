class SidekiqStatusController < ApplicationController
    def show
      if Sidekiq::ProcessSet.new.size > 0
        render json: { status: 'alive' }, status: :ok
      else
        render json: { status: 'dead' }, status: :service_unavailable
      end
    end
  end