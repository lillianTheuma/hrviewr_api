class BusinessProcessesController < ApplicationController
  before_action :set_business_process, only: [:show, :update, :destroy]

  # GET /business_processes
  def index
    @business_processes = BusinessProcess.all

    render json: @business_processes
  end

  # GET /business_processes/1
  def show
    render json: @business_process
  end

  # POST /business_processes
  def create
    @business_process = BusinessProcess.new(business_process_params)

    if @business_process.save
      render json: @business_process, status: :created, location: @business_process
    else
      render json: @business_process.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /business_processes/1
  def update
    if @business_process.update(business_process_params)
      render json: @business_process
    else
      render json: @business_process.errors, status: :unprocessable_entity
    end
  end

  # DELETE /business_processes/1
  def destroy
    @business_process.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_process
      @business_process = BusinessProcess.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def business_process_params
      params.fetch(:business_process, {})
    end
end
