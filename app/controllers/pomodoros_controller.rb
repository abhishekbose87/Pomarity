class PomodorosController < InheritedResources::Base
  def index
    @pomodoros = Pomodoro.all
  end
end
