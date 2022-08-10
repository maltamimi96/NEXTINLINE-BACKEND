class HairStylesController < ApplicationController
  before_action :set_hair_style, only: %i[ show update destroy ]

  # GET /hair_styles
  def index
    @hair_styles = HairStyle.all

    render json: @hair_styles
  end

  # GET /hair_styles/1
  def show
    render json: @hair_style
  end

  # POST /hair_styles
  def create
    @hair_style = HairStyle.new(hair_style_params)

    if @hair_style.save
      render json: @hair_style, status: :created, location: @hair_style
    else
      render json: @hair_style.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hair_styles/1
  def update
    if @hair_style.update(hair_style_params)
      render json: @hair_style
    else
      render json: @hair_style.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hair_styles/1
  def destroy
    @hair_style.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hair_style
      @hair_style = HairStyle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hair_style_params
      params.require(:hair_style).permit(:name, :duration)
    end
end
