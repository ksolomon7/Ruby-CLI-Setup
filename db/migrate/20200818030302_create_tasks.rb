class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :note
      t.string :status
      t.integer :event_id
    end
  end
end
