class Pomodoro < ActiveRecord::Base
  attr_accessible :count, :day
  default_value_for :day do
    Date.today
  end

  validates :count, presence: true

  def self.getWeeklyData

  	aggregates = {}
		pomodoros = self.getFullData

		if !pomodoros.empty?

			aggregates[:weekyear]= Hash.new(0)
			pomodoros.reverse.each do |x|
			aggregates[:weekyear][x.day.strftime("%G-W%V")] =  
								aggregates[:weekyear][x.day.strftime("%G-W%V")] + x.count
			end

		end

		return aggregates

  end

  def self.getLastWeekData

  	pomodoros = self.getFullData
  	last_week_data_array=[]

  	if !pomodoros.empty?
			last_day= pomodoros.last[:day] 
			last_Sunday= last_day - last_day.wday 
			last_week_data= pomodoros.select{|e| e[:day] > last_Sunday - 7 && e[:day] <= last_Sunday }
			last_week_hash={}
			last_week_data.each do |x|
			  last_week_hash[x[:day]]=x[:count]
			end
			last_week = ((last_Sunday - 6).. last_Sunday).to_a


			final_result =Hash[*last_week.product([0]).flatten].merge Hash[*last_week_hash.to_a.flatten]
			final_date=[]
			  
			final_result.each do |key,value|
			final_date<< key.strftime("%d %b")
			last_week_data_array<<value
			end
		end

  	return last_week_data_array
  end

  private 

  def self.getFullData
  	return Pomodoro.select("day,count").sort_by{|e| e[:day]}
  end

end
