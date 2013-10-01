ActiveAdmin.register Pomodoro do

  index do
    column :day
    column :count
    default_actions
  end
end
