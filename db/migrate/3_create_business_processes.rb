class CreateBusinessProcesses < ActiveRecord::Migration[6.0]
  def change
    create_table :business_processes do |t|
      t.string :name
      t.string :description
      t.integer :department_id
      t.timestamps
    end
  end
end
