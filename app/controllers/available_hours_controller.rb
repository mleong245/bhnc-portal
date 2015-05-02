class AvailableHoursController < ApplicationController
  def edit

  end

  def update
    current_user.available_hours.each do |hour|
        current_user.available_hours.delete(hour)
    end
    times = available_list
    times.each do |time|
      current_user.available_hours << time
    end
    flash[:notice] = "Successfully updated available hours!"
    redirect_to user_path(current_user)
  end

  private
  def available_list
    list = params[:available_hours]
    new_dates = []
    list.each do |key, value|
      if value == "1"
        new_dates += [key]
      end
    end
    times = []
    new_dates.each do |date|
      date = date.split(", ")
      day = date[0]
      time = date[1]
      times += [AvailableHour.where(:day_of_week => day, :start => time)]
    end
    times
  end


end
