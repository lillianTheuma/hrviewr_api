class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :employee_id
      t.integer :business_process_id
      t.string :task_name
      t.boolean :completed, :default => false
      t.integer :performance
      t.timestamps
    end
  end
end
