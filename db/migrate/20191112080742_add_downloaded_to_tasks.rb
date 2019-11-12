class AddDownloadedToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :downloaded, :boolean, default: false
  end
end
