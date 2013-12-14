class PagesController < ApplicationController
  def home

  	@final_count = Pomodoro.getLastWeekData
  	@aggregates = Pomodoro.getWeeklyData

  end

  def about 
  end
end
