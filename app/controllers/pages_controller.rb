class PagesController < ApplicationController
  def home
	  @temp=Pomodoro.select("day,count") 
	  @pomodoros = @temp.sort_by{|e| e[:day]}

	  @aggregates = {}
          @pomodoros.each do |x|
          [:year, :month, :cweek].each{|period|
          @aggregates[period] ||= Hash.new(0)
          @aggregates[period][x.day.send(period)] += x.count
	  }
	  end

          @last_day= @pomodoros.last[:day] 
	  @last_Sunday= @last_day - @last_day.wday 
	  @last_week_data= @pomodoros.select{|e| e[:day] > @last_Sunday - 7 && e[:day] <= @last_Sunday }
	  @last_week_hash={}
	  @last_week_data.each do |x|
		  @last_week_hash[x[:day]]=x[:count]
	  end
	 @last_week = ((@last_Sunday - 7).. @last_Sunday).to_a


	 @final_result =Hash[*@last_week.product([0]).flatten].merge Hash[*@last_week_hash.to_a.flatten]
	 @final_date=[]
 	 @final_count=[]	 
         @final_result.each do |key,value|
		@final_date<< key.strftime("%d %b")
		@final_count<<value
	 end

  end
  def about 
  end
end
