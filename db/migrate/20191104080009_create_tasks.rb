class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.references :algorithm, foreign_key: true
      t.float :time_taken_to_process
      t.float :input_file_size
      t.float :output_file_size
      t.boolean :submitted

      t.timestamps
    end
  end
end
