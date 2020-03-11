# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
processes_list = [
  ["process private loan","reviewing paperwork from private applicant to process a loan application",1],
  ["process corporate loan","reviewing paperwork from corporate applicant to process a loan application",1],
  ["Holdings>Payroll xfer","transfer funds from holdings account to payroll", 2],
  ["Holdings>Insurance xfer","transfer funds from holdings account to insurance", 2],
  ["audit holdings","audit holdings account transactions", 2]
]
processes_list.each do |name, description, department_id|
  @business_process = BusinessProcess.create(name: name, description: description, department_id: department_id)
  puts("Created Process #{@business_process.id}: #{@business_process.name}")
end

departments_list = [
  ["operations","handles business operations and loan applications"],
  ["finance","handles accounts and auditing"]
]

employees_list = [
  ["yukiko"],
  ["Alexis"],
  ["Mittens"]
]
#[process ID, task name, performance]
tasks_list = [

  [1,"sycosec loan application",1,5]
]

departments_list.each do |department_name, department_description|
  @department = Department.create(name: department_name, description: department_description)
  puts("Created Department: #{@department.name}")
  employees_list.each do |employee_name|
    @employee = Employee.create(department_id: @department.id, name: employee_name)
    puts("Created Employee: #{@employee.name}")
    tasks_list.each do |pid, name, depid, performance|
      if @department.id == depid
        @task = Task.create(employee_id: @employee.id, business_process_id: pid, task_name: name, completed: false, performance: performance)
        puts("Made a task for the #{@department.name} department, #{@task.business_process}")
      end
    end
  end
end
