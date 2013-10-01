class CreatePomodoros < ActiveRecord::Migration
  def change
    create_table :pomodoros do |t|
      t.date :day
      t.integer :count

      t.timestamps
    end
  end
end
