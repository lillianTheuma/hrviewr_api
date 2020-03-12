class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize! #requires access token for all actions
  # GET /employees
  def index
    @employees = Employee.all

    render json: @employees
  end

  # GET /employees/1
  def show
    render json: @employee
  end



  # POST /employees
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      render json: @employee, status: :created, location: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employees/1
  def update
    if @employee.update(employee_params)
      render json: @employee
    else
      render json: @employee.errors, status: :unprocessable_entity
    end
  end

  # DELETE /employees/1
  def destroy
    @employee.destroy
  end

  # GET tasks that are not complete
  def active_tasks
    @employee = Employee.find(params[:employee_id])
    tasks = []
    @employee.tasks.each do |task|
      puts(task.completed )
      if (task.completed == false)
        tasks.push(task)
      end
    end
    render json: tasks
  end

  def get_active_tasks_by_process
    @employee = Employee.find(params[:employee_id])
    @processes = BusinessProcess.all
    tasks_by_process = []
    @processes.each do |process|
      tasks = []
      process.tasks.each do |task|
        if (task.employee_id = @employee.id) && (task.completed == false)
          tasks.push(task)
        end
      end
      tasks_by_process.push(tasks)
    end
    render json: tasks_by_process
  end

  def get_tasks_by_process
    @employee = Employee.find(params[:employee_id])
    @processes = BusinessProcess.all
    tasks_by_process = []
    @processes.each do |process|
      tasks = []
      process.tasks.each do |task|
        if task.employee_id = @employee.id
          tasks.push(task)
        end
      end
      tasks_by_process.push(tasks)
    end
    render json: tasks_by_process
  end

  def get_average_performance_by_process
    @employee = Employee.find(params[:employee_id])
    @processes = BusinessProcess.all
    tasks_by_process = []
    @processes.each do |process|
      count = 0
      sum = 0
      process.tasks.each do |task|
        if (task.employee_id = @employee.id) && (task.completed == false)
          count += 1
          if task.performance
            sum += task.performance
          end
        end
      end

      average = (sum/count).floor
      result = {business_process_id: @process.id, performance_average: average}
      tasks_by_process.push()
    end
    render json: tasks_by_process
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.permit(:department_id, :name)
    end
end
