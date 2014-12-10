class StaticController < ApplicationController

  def index

  end

  def users_list
    @users = User.all
    respond_to do |format|
      # format.html { render json: @users }
      format.json { render json: @users }
    end
    
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
    @payments = @event.payments.sort_by(&:date_paid).reverse
    
    respond_to do |format|
      format.html { render json: @payments.to_json(include: [:currency]) }
      format.json { render json: @payments.to_json(include: [:currency, :event])}
    end

  end

  def event_payments_by_user
    @event = Event.find(params[:id])
    @users = @event.users
    payments_by_user_grouped = @event.payments.group_by(&:user_id)
    arr = []
    i=0
    payments_by_user_grouped.each do | k, v |
      output = {}  
      output[:value] = v.sum(&:amount)
      user_name = @users.find(k).name
      output[:label] = user_name
      wheel_color = (360 / payments_by_user_grouped.count) * i
      colour_array = "hsl(" + wheel_color.to_s + " , 50%, 50%)"
      output[:color] = colour_array  
      i = i + 1
      arr << output  
    end

    @payments_by_user = arr

    respond_to do |format|
      format.html { render json: @payments_by_user }
      format.json { render json: @payments_by_user }
    end

  end

  def new_event_users
    @event = Event.find(params[:id])
    @event.users << User.find(params[:user_ids])
    respond_to do |format|
      format.json { render json: @event }
    end
  end 

end
