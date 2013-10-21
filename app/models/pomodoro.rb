class Pomodoro < ActiveRecord::Base
  attr_accessible :count, :day
  default_value_for :day do
    Date.today
  end
end
