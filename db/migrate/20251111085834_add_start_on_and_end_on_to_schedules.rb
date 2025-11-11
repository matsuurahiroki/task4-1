class AddStartOnAndEndOnToSchedules < ActiveRecord::Migration[7.2]
  def change
    add_column :schedules, :start_on, :date
    add_column :schedules, :end_on, :date
  end
end
