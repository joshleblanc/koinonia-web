class GeminiConfigPartsController < ApplicationController
  before_action :set_gemini_config_part, only: %i[ show edit update destroy ]
  before_action :set_gemini_config, only: %i[index create new]

  # GET /gemini_config_parts or /gemini_config_parts.json
  def index
    @gemini_config_parts = @gemini_config.gemini_config_parts
  end

  # GET /gemini_config_parts/1 or /gemini_config_parts/1.json
  def show
  end

  # GET /gemini_config_parts/new
  def new
    @gemini_config_part = GeminiConfigPart.new
    @gemini_config_part.gemini_config = @gemini_config
    authorize @gemini_config_part
  end

  # GET /gemini_config_parts/1/edit
  def edit
  end

  # POST /gemini_config_parts or /gemini_config_parts.json
  def create
    @gemini_config_part = GeminiConfigPart.new(gemini_config_part_params)
    @gemini_config_part.gemini_config = @gemini_config

    authorize @gemini_config_part

    respond_to do |format|
      if @gemini_config_part.save
        format.html { redirect_to new_gemini_config_gemini_config_part_url(@gemini_config), notice: "Gemini config part was successfully created." }
        format.json { render :show, status: :created, location: @gemini_config_part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gemini_config_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gemini_config_parts/1 or /gemini_config_parts/1.json
  def update
    respond_to do |format|
      if @gemini_config_part.update(gemini_config_part_params)
        format.html { redirect_to gemini_config_part_url(@gemini_config_part), notice: "Gemini config part was successfully updated." }
        format.json { render :show, status: :ok, location: @gemini_config_part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gemini_config_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gemini_config_parts/1 or /gemini_config_parts/1.json
  def destroy
    gemini_config = @gemini_config_part.gemini_config
    @gemini_config_part.destroy!

    respond_to do |format|
      format.html { redirect_to gemini_config_gemini_config_parts_url(gemini_config), notice: "Gemini config part was successfully destroyed." }
      format.json { head :no_content }
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gemini_config_part
      @gemini_config_part = GeminiConfigPart.find(params[:id])
    end

    def set_gemini_config 
      @gemini_config = GeminiConfig.find(params[:gemini_config_id])
    end

    # Only allow a list of trusted parameters through.
    def gemini_config_part_params
      params.require(:gemini_config_part).permit(:text)
    end
end
