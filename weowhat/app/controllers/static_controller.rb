class StaticController < ApplicationController
  def index
  end

  def event_users
    @event = Event.find(params[:id])
    @users = @event.users

    respond_to do |format|
      # format.html { render json: @users }
      format.json { render json: @users }
    end

  end

  def event_payments
    @event = Event.find(params[:id])
    @payments = @event.payments
    
    respond_to do |format|
      format.html { render json: @payments.to_json(include: [:currency, :purpose]) }
      format.json { render json: @payments.to_json(include: [:currency, :purpose, :event])}
    end

  end
end
