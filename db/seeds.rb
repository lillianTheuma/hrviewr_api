# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
processes_list = [
  ["process private loan","reviewing paperwork from private applicant to process a loan application"],
  ["process corporate loan","reviewing paperwork from corporate applicant to process a loan application"],
  ["Holdings>Payroll xfer","transfer funds from holdings account to payroll"],
  ["Holdings>Insurance xfer","transfer funds from holdings account to insurance"],
  ["audit holdings","audit holdings account transactions"]
]
processes_list.each do |name, description|
  @business_process = BusinessProcess.create(name: name, description: description)
  puts("Created Process: #{@business_process}")
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

tasks_list = [
  [1,"sycosec loan application",5]
]

departments_list.each do |department_name, department_description|
  @department = Department.create(name: department_name, description: department_description)
  puts("Created Department: #{@department.name}")
  employees_list.each do |employee_name|
    @employee = Employee.create(department_id: @department.id, name: employee_name)
    puts("Created Employee: #{@employee.name}")
  end
end
