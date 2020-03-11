class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :tasks, :employees
    add_foreign_key :tasks, :business_processes
    add_foreign_key :employees, :departments
  end
end
