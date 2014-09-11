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
      format.html { render json: @payments }
      format.json { render json: @payments }
    end

  end
end
