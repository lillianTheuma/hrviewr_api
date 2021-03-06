class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :update, :destroy]
  #before_action :doorkeeper_authorize! #requires access token for all actions
  # GET /departments
  def index
    @departments = Department.all

    render json: @departments
  end

  # GET /departments/1
  def show
    render json: @department
  end

  # GET /departments/1/processes
  def processes
    @department = Department.find(params[:department_id])
    @processes = @department.business_processes
    render json: @processes
  end

  # GET /departments/1/lowPerformance
  # Gets list of employees with low average performance
  def lowPerformance
    puts("the code ran!")
    @department = Department.find(params[:department_id])
    @employees = @department.employees
    low_performance = []
    @employees.each do |employee|
      if employee.average_performance <= 3
        low_performance.push({employee: employee, performance: employee.average_performance})
      end
    end
    return low_performance
  end
  
  # POST /departments
  def create
    @department = Department.new(department_params)

    if @department.save
      render json: @department, status: :created, location: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departments/1
  def update
    if @department.update(department_params)
      render json: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  # DELETE /departments/1
  def destroy
    @department.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def department_params
      params.permit(:name, :description)
    end
end
