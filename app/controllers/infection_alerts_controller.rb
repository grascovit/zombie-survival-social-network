class InfectionAlertsController < ApplicationController
  before_action :set_infection_alert, only: [:show, :update, :destroy]

  # GET /infection_alerts
  def index
    @infection_alerts = InfectionAlert.all

    render json: @infection_alerts
  end

  # GET /received_infection_alerts
  def received_infection_alerts
    @infection_alerts = InfectionAlert.where(infected_user_id: params[:user_id])

    render json: @infection_alerts
  end

  # GET /reported_infection_alerts
  def reported_infection_alerts
    @infection_alerts = InfectionAlert.where(reporter_user_id: params[:user_id])

    render json: @infection_alerts
  end

  # GET /infection_alerts/1
  def show
    render json: @infection_alert
  end

  # POST /infection_alerts
  def create
    @infection_alert = InfectionAlert.new(infection_alert_params)

    if @infection_alert.save
      render json: @infection_alert, status: :created, location: @infection_alert
    else
      render json: @infection_alert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /infection_alerts/1
  def update
    if @infection_alert.update(infection_alert_params)
      render json: @infection_alert
    else
      render json: @infection_alert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /infection_alerts/1
  def destroy
    @infection_alert.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_infection_alert
    @infection_alert = InfectionAlert.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def infection_alert_params
    params.require(:infection_alert).permit(:infected_user_id, :reporter_user_id)
  end
end
