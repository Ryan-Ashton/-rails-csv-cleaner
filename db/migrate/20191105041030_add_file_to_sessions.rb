class AddFileToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :file, :string
  end
end
