class AddStatsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :filesize, :integer
  end
end
