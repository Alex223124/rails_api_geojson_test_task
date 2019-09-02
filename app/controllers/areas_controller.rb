class AreasController < ApplicationController
  before_action :set_area, only: [:show]

  # GET /areas
  def index
    @areas = Area.all
    render json: AreasPresenter.new(@areas)
  end

  # GET /areas/1
  def show
    render json: @area
  end

  # POST /areas
  def create
    @area = Area.new(area_params)
    if @area.save
      render json: @area, status: :created, location: @area
    else
      render_error_response(@area.errors.messages, 422)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area
      @area = Area.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def area_params
      params.require(:area).permit(:name)
    end
end
